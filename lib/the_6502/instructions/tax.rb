module The6502

  module Instructions

    class TAX

      attr_accessor :processor

      def initialize processor
        self.processor = processor
      end

      def execute instruction
        processor.x = processor.a
      end

    end

  end

end
