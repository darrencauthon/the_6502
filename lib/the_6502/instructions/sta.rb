module The6502

  class STA < The6502::Instruction

    def execute instruction
      location = instruction.split('$')[1].to_i(16)
      processor.memory[location] = processor.a
    end

  end

end
