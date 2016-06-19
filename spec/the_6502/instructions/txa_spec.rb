require_relative '../../spec_helper'

describe "TXA" do

  let(:processor) { The6502::Processor.new }

  it "should load the contents of X into A" do
    value = Object.new

    processor.x = value

    processor.execute "TXA"

    processor.a.must_be_same_as value
  end

end
