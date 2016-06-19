module The6502

  class SEC < The6502::Instruction

    def execute instruction
      processor.carry_flag = true
    end

    def size_of _
      1
    end

  end

end
