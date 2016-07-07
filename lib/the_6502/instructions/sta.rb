module The6502

  class STA < The6502::Instruction

    def execute instruction
      location = instruction.split('$')[1].to_i(16)
      processor.memory[location] = processor.a
    end

    def size_of instruction
      3
    end

    def to_bytes instruction
      operands = instruction.split(' ')
      operands.shift
      operands = operands
        .map { |z| { original: z, resolved: z.gsub('$', '').split('').each_with_index.map { |x, i| [x, i / 2] }.group_by { |x| x[1] }.map { |x| x[1].map {|y| y[0] }.join('') }.reverse } }
        .map { |z| z[:resolved] }
        .flatten
      [0x8d, operands[0].to_i(16), operands[1].to_i(16)]
    end

  end

end
