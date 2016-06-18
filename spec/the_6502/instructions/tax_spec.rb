require_relative '../../spec_helper'

describe "TAX" do

  let(:processor) { The6502::Processor.new }

  it "should load the contents of A into X" do
    value = Object.new

    processor.a = value

    processor.execute "TAX"

    processor.x.must_be_same_as value
  end

end
