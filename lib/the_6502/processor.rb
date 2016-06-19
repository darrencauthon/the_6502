require_relative 'instructions/adc'
require_relative 'instructions/brk'
require_relative 'instructions/clv'
require_relative 'instructions/inx'
require_relative 'instructions/lda'
require_relative 'instructions/sta'
require_relative 'instructions/tax'

module The6502
  class Processor

    attr_accessor :a
    attr_accessor :x
    attr_accessor :memory
    attr_accessor :v

    def initialize
      self.memory = {}
      self.x = 0
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
      input.split("\n").each do |line|
        instruction_for(line).execute line
      end
    end

    def memory_at location
      memory[location]
    end

    private

    def instruction_for instruction
      command = instruction.split(' ')[0].upcase
      eval("The6502::#{command}").new self
    end

  end
end
