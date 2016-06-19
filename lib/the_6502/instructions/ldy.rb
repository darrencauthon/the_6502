module The6502

  class LDY < The6502::Instruction

    def execute instruction
      processor.y = operands_from(instruction)[0]
    end

  end

end
