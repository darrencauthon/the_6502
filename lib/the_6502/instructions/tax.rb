module The6502

  class TAX < The6502::Instruction

    def execute instruction
      processor.x = processor.a
    end

  end

end
