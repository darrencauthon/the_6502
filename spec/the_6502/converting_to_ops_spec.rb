require_relative '../spec_helper'

describe "new memory" do

  let(:processor) { The6502::Processor.new }

  it "should be set to true when the math on a is greater than a byte" do
    processor.execute(
<<EOF
LDA \#$01
EOF
    )
    processor.new_memory[0].must_equal 0xa9
    processor.new_memory[1].must_equal 0x01
  end

  it "should be set to true when the math on a is greater than a byte" do
    processor.execute(
<<EOF
LDA \#$01
STA $0200
LDA \#$05
STA $0201
LDA \#$08
STA $0202
EOF
    )
    processor.new_memory[0].must_equal 0xa9
    processor.new_memory[1].must_equal 0x01
    processor.new_memory[2].must_equal 0x8d
    processor.new_memory[3].must_equal 0x00
    processor.new_memory[4].must_equal 0x02
    processor.new_memory[5].must_equal 0xa9
    processor.new_memory[6].must_equal 0x05
    processor.new_memory[7].must_equal 0x8d
    processor.new_memory[8].must_equal 0x01
    processor.new_memory[9].must_equal 0x02
    processor.new_memory[10].must_equal 0xa9
    processor.new_memory[11].must_equal 0x08
    processor.new_memory[12].must_equal 0x8d
    processor.new_memory[13].must_equal 0x02
    processor.new_memory[14].must_equal 0x02
  end

end
