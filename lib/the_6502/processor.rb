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

    def initialize
      self.memory = {}
      self.x = 0
      self.y = 0
      self.a = 0
      self.carry_flag = false
    end

    def carry_flag
      self.v
    end

    def carry_flag= value
      self.v = value
    end

    def execute input
      input.split("\n")
           .map    { |l| { line: l, instruction: instruction_for(l) } }
           .select { |x| x[:instruction] }
           .each   { |x| x[:instruction].execute x[:line] }
    end

    def memory_at location
      memory[location]
    end

    private

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
