module The6502

  class CLV < The6502::Instruction

    def execute instruction
      processor.carry_flag = false
    end

  end

end
