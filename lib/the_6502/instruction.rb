module The6502
  class Instruction
    attr_accessor :processor

    def initialize processor
      self.processor = processor
    end
  end
end
