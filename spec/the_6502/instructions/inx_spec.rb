require_relative '../../spec_helper'

describe "INX" do

  let(:processor) { The6502::Processor.new }

  it "should add one to X" do
    processor.x = 1
    processor.execute "INX"
    processor.x.must_equal 2

    processor.x = 10
    processor.execute "INX"
    processor.x.must_equal 11
  end

end

