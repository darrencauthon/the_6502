module The6502
  class Instruction
    attr_accessor :processor

    def initialize processor
      self.processor = processor
    end

    def size_of instruction
      2
    end
  end
end
