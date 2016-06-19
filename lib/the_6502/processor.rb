Dir[File.dirname(__FILE__) + '/instructions/*.rb'].each { |f| require f }

module The6502

  class Processor

    attr_accessor :a
    attr_accessor :x
    attr_accessor :y
    attr_accessor :memory
    attr_accessor :v
    attr_accessor :labels
    attr_accessor :pc

    attr_accessor :hard_stop

    def initialize
      self.memory = {}
      self.x = 0
      self.y = 0
      self.a = 0
      self.carry_flag = false
      self.labels = {}
      self.pc = 0
    end

    def carry_flag
      self.v
    end

    def carry_flag= value
      self.v = value
    end

    def execute code
      build_labels_for code
      load_the_instructions_into_memory code
      execute_the_program
    end

    def memory_at location
      memory[location]
    end

    private

    def execute_the_program
      self.pc = 0
      while instruction = instruction_for(self.memory[self.pc]) do
        instruction.execute self.memory[self.pc]
        self.pc += instruction.size_of(self.memory[self.pc])
        return if hard_stop
      end
    end

    def load_the_instructions_into_memory code
      counter = 0
      build_lines_from(code)
          .select { |x| x[:instruction] }
          .each do |x|
            self.memory[counter] = x[:line]
            counter += x[:instruction].size_of(x[:line])
          end
    end

    def build_labels_for code
      lines = build_lines_from(code)

      lines.select { |x| x[:instruction].nil? }
           .map    { |x| { name:    x[:line].gsub(':', ''), 
                           address: lines
                                      .select { |y| y[:instruction] && y[:index] < x[:index] }
                                      .map { |z| z[:instruction].size_of(z[:line]) }
                                      .reduce(0) { |t, i| t + i } } }
           .each   { |x| self.labels[x[:name]] = x[:address] }
    end

    def build_lines_from code
      code.split("\n")
          .each_with_index
          .map    { |l, i| { index: i, line: l, instruction: instruction_for(l) } }
    end

    def instruction_for instruction
      command = "The6502::#{instruction.split(' ')[0].upcase}"
      return nil unless Object.const_defined?(command)
      eval(command).new self
    rescue
      nil
    end

  end

end
