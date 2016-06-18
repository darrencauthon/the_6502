require_relative 'instructions/inx'
require_relative 'instructions/lda'
require_relative 'instructions/sta'
require_relative 'instructions/tax'

module The6502
  class Processor

    attr_accessor :a
    attr_accessor :x
    attr_accessor :memory

    def initialize
      self.memory = {}
      self.x = 0
      self.a = 0
    end

    def execute input
      instruction_for(input).execute input
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
