module The6502

  class LDX < The6502::Instruction

    def execute instruction
      value = instruction.split('$')[1].to_i(16)
      value = processor.memory_at(value) unless instruction.include?('#')
      processor.x = value
    end

  end

end
