require 'rspec'
require_relative 'string_calculator'


describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  context "with empty string" do
    it "returns 0" do
      expect(calculator.add("")).to eq(0)
    end
  end

end

