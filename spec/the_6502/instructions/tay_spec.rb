require_relative '../../spec_helper'

describe "TAY" do

  let(:processor) { The6502::Processor.new }

  it "should load the contents of A into Y" do
    value = Object.new

    processor.a = value

    processor.execute "TAY"

    processor.y.must_be_same_as value
  end

end
