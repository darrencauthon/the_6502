require_relative 'instructions/lda'

module The6502
  class Processor
    def something
    end

    def execute instruction
      value = instruction.split('$')[1]
      @a = value.to_i(16)
    end

    def a
      @a
    end
  end
end
