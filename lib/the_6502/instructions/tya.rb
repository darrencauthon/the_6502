module The6502

  class TYA < The6502::Instruction

    def execute instruction
      processor.a = processor.y
    end

  end

end
