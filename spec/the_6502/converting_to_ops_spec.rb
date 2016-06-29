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

end
