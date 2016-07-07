module The6502

  class LDA < The6502::Instruction

    def execute instruction
      processor.a = operands_from(instruction)[0]
    end

    def to_bytes instruction
      value = operands_from(instruction)[0]
      puts '---'
      puts value.inspect
      puts value % 4
      puts value / 4
      puts '---'
      [0xa9, value]
    end

  end

end
