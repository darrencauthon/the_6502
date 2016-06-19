module The6502

  class LDA < The6502::Instruction

    def execute instruction
      value = instruction.split('$')[1].to_i(16)
      value = processor.memory_at(value) unless instruction.include?('#')
      processor.a = value
    end

  end

end
