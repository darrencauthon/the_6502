require_relative '../spec_helper'

describe "the processor" do

  let(:processor) { The6502::Processor.new }

  it "should default x to 0" do
    processor.x.must_equal 0
  end

  it "should default a to 0" do
    processor.a.must_equal 0
  end

end
