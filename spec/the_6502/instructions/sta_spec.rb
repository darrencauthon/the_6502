require_relative '../../spec_helper'

describe "STA" do

  let(:processor) { The6502::Processor.new }

  it "should should load the contents of A into the provided memory location" do
    processor.a = 1
    processor.execute 'STA $0200'
    processor.memory_at(512).must_equal 1
  end

  it "should should load the contents of A into the provided memory location" do
    processor.a = 12
    processor.execute 'STA $0500'
    processor.memory_at(1280).must_equal 12
  end

end
