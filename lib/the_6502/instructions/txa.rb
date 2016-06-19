module The6502

  class TXA < The6502::Instruction

    def execute instruction
      processor.a = processor.x
    end

  end

end
