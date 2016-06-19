require_relative '../../spec_helper'

describe "TYA" do

  let(:processor) { The6502::Processor.new }

  it "should load the contents of Y into A" do
    value = Object.new

    processor.y = value

    processor.execute "TYA"

    processor.a.must_be_same_as value
  end

end
