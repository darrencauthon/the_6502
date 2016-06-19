module The6502

  module AccumulatorMath

    def self.add processor, value
      processor.a += value
      processor.carry_flag = true if processor.a > 255
      processor.a = processor.a % 256
    end

  end

end
