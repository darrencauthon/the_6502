module The6502

  class ADC < The6502::Instruction

    def execute instruction
      value = instruction.split('$')[1].to_i(16)
      The6502::AccumulatorMath.add processor, value
    end

  end

end
