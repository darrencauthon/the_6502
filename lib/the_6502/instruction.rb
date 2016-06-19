module The6502
  class Instruction
    attr_accessor :processor

    def initialize processor
      self.processor = processor
    end

    def size_of instruction
      2
    end

    def operands_from instruction
      items = instruction.split(' ')
      items.shift
      items
        .map { |x| { original: x, resolved: x.split('$')[1].to_i(16) } }
        .map { |x| x[:original].include?('#') ? x[:resolved] : processor.memory_at(x[:resolved]) }
    end
  end
end
