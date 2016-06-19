require_relative '../../spec_helper'

describe "BRK" do

  let(:processor) { The6502::Processor.new }

  it "should stop the program at the proper point" do
    processor.carry_flag = true
    processor.execute(<<EOF
LDA \#$0A
STA $0200
BRK
LDA \#$0A
STA $0200
EOF
    )
    processor.pc.must_equal 6
  end

end
