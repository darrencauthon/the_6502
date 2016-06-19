module The6502

  class ADC < The6502::Instruction

    def execute instruction
      value = instruction.split('$')[1]
      processor.a += value.to_i(16)
    end

  end

end
