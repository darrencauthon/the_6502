require_relative '../../spec_helper'

describe "LDA" do

  it "should load an exact value" do
    processor = The6502::Processor.new

    processor.execute "LDA #$01"

    processor.a.must_equal 1
  end

end
