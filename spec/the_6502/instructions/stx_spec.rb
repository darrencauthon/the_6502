require_relative '../../spec_helper'

describe "STX" do

  let(:processor) { The6502::Processor.new }

  it "should should load the contents of X into the provided memory location" do
    processor.x = 1
    processor.execute 'STX $0200'
    processor.memory_at(512).must_equal 1
  end

  it "should should load the contents of X into the provided memory location" do
    processor.x = 12
    processor.execute 'STX $0500'
    processor.memory_at(1280).must_equal 12
  end

end
