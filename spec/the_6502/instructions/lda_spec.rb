require_relative '../../spec_helper'

describe "LDA" do

  let(:processor) { The6502::Processor.new }

  it "should load an exact value" do
    processor.execute 'LDA #$01'
    processor.a.must_equal 1
  end

  it "should work with hex values" do
    processor.execute 'LDA #$0A'
    processor.a.must_equal 10
  end

  it "should load from memory" do
    processor.memory[10] = 11
    processor.execute 'LDA $0A'
    processor.a.must_equal 11
  end

end
