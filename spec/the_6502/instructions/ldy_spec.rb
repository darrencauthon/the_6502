require_relative '../../spec_helper'

describe "LDY" do

  let(:processor) { The6502::Processor.new }

  it "should load an exact value" do
    processor.execute 'LDY #$01'
    processor.y.must_equal 1
  end

  it "should work with hex values" do
    processor.execute 'LDY #$0A'
    processor.y.must_equal 10
  end

  it "should load from memory" do
    processor.memory[10] = 11
    processor.execute 'LDY $0A'
    processor.y.must_equal 11
  end

end
