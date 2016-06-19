module The6502

  class TAY < The6502::Instruction

    def execute instruction
      processor.y = processor.a
    end

  end

end
