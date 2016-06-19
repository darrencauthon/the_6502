module The6502

  class LDY < The6502::Instruction

    def execute instruction
      value = instruction.split('$')[1].to_i(16)
      value = processor.memory_at(value) unless instruction.include?('#')
      processor.y = value
    end

  end

end
