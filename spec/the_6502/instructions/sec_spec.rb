require_relative '../../spec_helper'

describe "SEC" do

  let(:processor) { The6502::Processor.new }

  it "should load an exact value" do
    processor.carry_flag = false
    processor.execute 'SEC'
    processor.carry_flag.must_equal true
  end

end
