require_relative '../../spec_helper'

describe "CLV" do

  let(:processor) { The6502::Processor.new }

  it "should clear the carry flag" do
    processor.carry_flag = true
    processor.execute "CLV"
    processor.carry_flag.must_equal false
  end

end
