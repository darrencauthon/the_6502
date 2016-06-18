module The6502

  module Instructions

    class LDA

      attr_accessor :processor

      def initialize processor
        self.processor = processor
      end

      def execute instruction
        value = instruction.split('$')[1]
        processor.a = value.to_i(16)
      end

    end

  end

end
