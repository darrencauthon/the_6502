module The6502

  class BRK < The6502::Instruction

    def execute instruction
      processor.hard_stop = true
    end

    def size_of instruction
      1
    end

  end

end
