Dir[File.dirname(__FILE__) + '/instructions/*.rb'].each { |f| require f }

module The6502
  class Processor

    attr_accessor :a
    attr_accessor :x
    attr_accessor :y
    attr_accessor :memory
    attr_accessor :v
    attr_accessor :labels

    def initialize
      self.memory = {}
      self.x = 0
      self.y = 0
      self.a = 0
      self.carry_flag = false
      self.labels = {}
    end

    def carry_flag
      self.v
    end

    def carry_flag= value
      self.v = value
    end

    def execute code
      build_labels_for code

      execute_instructions code
    end

    def memory_at location
      memory[location]
    end

    private

    def execute_instructions code
      build_lines_from(code)
          .select { |x| x[:instruction] }
          .each   { |x| x[:instruction].execute x[:line] }
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
      command = instruction.split(' ')[0].upcase
      command = "The6502::#{command}"
      return nil unless Object.const_defined?(command)
      @class = eval(command)
      @class.new self
    rescue
      nil
    end

  end
end
