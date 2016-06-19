require_relative '../spec_helper'

describe "the processor" do

  let(:processor) { The6502::Processor.new }

  it "should default x to 0" do
    processor.x.must_equal 0
  end

  it "should default y to 0" do
    processor.y.must_equal 0
  end

  it "should default a to 0" do
    processor.a.must_equal 0
  end

  it "should default z to false" do
    processor.z.must_equal false
  end

  describe "carry flag" do

    it "should default to false" do
      processor.carry_flag.must_equal false
    end

    it "should be set to true when the math on a is greater than a byte" do
      processor.execute(
<<EOF
LDA \#$ff
ADC \#$01
EOF
      )
      processor.carry_flag.must_equal true
    end

    it "should be set to false when the math on a is less than a byte" do
      processor.execute(
<<EOF
LDA \#$ff
ADC \#$00
EOF
      )
      processor.carry_flag.must_equal false
    end

    it "should be aliased to v" do
      processor.carry_flag = true
      processor.v.must_equal true
      processor.carry_flag = false
      processor.v.must_equal false
    end

  end

  describe "running programs" do

    describe "first simple program" do

      let(:code) do
<<EOF
LDA \#$0A
STA $0200
LDA \#$05
STA $0201
LDA \#$08
STA $0202
EOF
      end

      it "should set 512 to 10" do
        processor.execute code
        processor.memory_at(512).must_equal 10
      end

      it "should set 513 to 5" do
        processor.execute code
        processor.memory_at(513).must_equal 5
      end

      it "should set 514 to 8" do
        processor.execute code
        processor.memory_at(514).must_equal 8
      end

    end

    describe "second simple program" do

      let(:code) do
<<EOF
LDA \#$c0
TAX
INX
ADC \#$04
BRK
EOF
      end

      it "should set the a register to 196" do
        processor.execute code
        processor.a.must_equal 196
      end

      it "should set the x register to 192" do
        processor.execute code
        processor.x.must_equal 193
      end

    end

  end

  describe "extra spaces in front of the instruction" do

    let(:code) do
<<EOF
  LDA \#$0A
  STA $0200
  LDA \#$05
  STA $0201
    LDA \#$08
       STA $0202
EOF
    end

    it "should still work" do
      processor.execute code
      processor.memory_at(512).must_equal 10
      processor.memory_at(513).must_equal 5
      processor.memory_at(514).must_equal 8
    end

  end

  describe "labels in the code" do

    let(:code) do
<<EOF
  LDA \#$0A
  STA $0200
decrement:
  LDA \#$05
  STA $0201
another_label:
  LDA \#$08
  STA $0202
EOF
    end

    it "should still work" do
      processor.execute code
      processor.memory_at(512).must_equal 10
      processor.memory_at(513).must_equal 5
      processor.memory_at(514).must_equal 8
    end

    it "should remember the label for decrement" do
      processor.execute code
      processor.labels['decrement'].must_equal 5
    end

    it "should remember the label for another_label" do
      processor.execute code
      processor.labels['another_label'].must_equal 10
    end

  end

  describe "program counter" do

    it "should be set to the last address executed, first example" do
      code = <<EOF
  LDA \#$0A
  STA $0200
EOF
      processor.execute code
      processor.pc.must_equal 5
    end

    it "should be set to the last address executed, second example" do
      code = <<EOF
  LDA \#$0A
  STA $0200
  LDA \#$0A
  STA $0200
EOF
      processor.execute code
      processor.pc.must_equal 10 
    end

  end

end
