module The6502

  class LDX < The6502::Instruction

    def execute instruction
      processor.x = operands_from(instruction)[0]
    end

  end

end
