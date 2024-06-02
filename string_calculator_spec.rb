require 'rspec'
require_relative 'string_calculator'


describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  context "with empty string" do
    it "returns 0" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number for a single number" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(calculator.add("1,5")).to eq(6)
    end
  end

end

