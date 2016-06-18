module The6502

  class INX < The6502::Instruction

    def execute instruction
      processor.x += 1
    end

  end

end
