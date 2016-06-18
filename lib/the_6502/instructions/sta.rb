module The6502

  module Instructions

    class STA

      attr_accessor :processor

      def initialize processor
        self.processor = processor
      end

      def execute instruction
        location = instruction.split('$')[1].to_i(16)
        processor.memory[location] = processor.a
      end

    end

  end

end
