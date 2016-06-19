require_relative 'instructions/adc'
require_relative 'instructions/brk'
require_relative 'instructions/clv'
require_relative 'instructions/inx'
require_relative 'instructions/lda'
require_relative 'instructions/ldx'
require_relative 'instructions/ldy'
require_relative 'instructions/sta'
require_relative 'instructions/tax'

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

    def execute input
      build_labels_for input

      build_lines_from(input)
          .select { |x| x[:instruction] }
          .each   { |x| x[:instruction].execute x[:line] }
    end

    def memory_at location
      memory[location]
    end

    private

    def build_labels_for input
      lines = build_lines_from(input)

      lines.select { |x| x[:instruction].nil? }
           .map    { |x| { name:    x[:line].gsub(':', ''), 
                           address: lines
                                      .select { |y| y[:instruction] && y[:index] < x[:index] }
                                      .map { |z| z[:instruction].size_of(z[:line]) }
                                      .reduce(0) { |t, i| t + i } } }
           .each   { |x| self.labels[x[:name]] = x[:address] }
    end

    def build_lines_from input
      input.split("\n")
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
