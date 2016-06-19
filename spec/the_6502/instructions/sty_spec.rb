require_relative '../../spec_helper'

describe "STY" do

  let(:processor) { The6502::Processor.new }

  it "should should load the contents of Y into the provided memory location" do
    processor.y = 1
    processor.execute 'STY $0200'
    processor.memory_at(512).must_equal 1
  end

  it "should should load the contents of Y into the provided memory location" do
    processor.y = 12
    processor.execute 'STY $0500'
    processor.memory_at(1280).must_equal 12
  end

end
