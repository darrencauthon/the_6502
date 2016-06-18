module The6502

  module Instructions

    class INX

      attr_accessor :processor

      def initialize processor
        self.processor = processor
      end

      def execute instruction
        processor.x += 1
      end

    end

  end

end
