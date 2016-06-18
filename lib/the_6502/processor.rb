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

    def execute instruction
      command = instruction.split(' ')[0].upcase
      instruction_type = eval("The6502::Instructions::#{command}")
      instruction_type.new(self).execute(instruction)
    end

    def memory_at location
      memory[location]
    end

  end
end
