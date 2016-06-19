module The6502

  class LDA < The6502::Instruction

    def execute instruction
      processor.a = operands_from(instruction)[0]
    end

  end

end
