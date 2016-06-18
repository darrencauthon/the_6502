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
      if instruction.split(' ')[0] == 'STA'
        location = instruction.split('$')[1].to_i(16)
        self.memory[location] = a
      elsif instruction.split(' ')[0] == 'TAX'
        self.x = self.a
      elsif instruction.split(' ')[0] == 'INX'
        self.x += 1
      else
        value = instruction.split('$')[1]
        self.a = value.to_i(16)
      end
    end

    def memory_at location
      memory[location]
    end

  end
end
