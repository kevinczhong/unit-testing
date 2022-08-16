require "rspec"

class RomanNumerals
  def roman(number)
    rome = ""
    thousands = (number / 1000).floor()
    thousands.times do
      rome += "M"
    end
    remainder = number % 1000
    five_hundreds = (remainder / 500).floor()
    five_hundreds.times do
      rome += "D"
    end
    remainder = remainder % 500
    hundreds = (remainder / 100).floor()
    hundreds.times do
      rome += "C"
    end
    remainder = remainder % 100
    fifties = (remainder / 50).floor()
    fifties.times do
      rome += "L"
    end
    remainder = remainder % 50
    tens = (remainder / 10).floor()
    tens.times do
      rome += "X"
    end
    remainder = remainder % 10
    fives = (remainder / 5).floor()
    fives.times do
      rome += "V"
    end
    remainder = remainder % 5
    ones = remainder
    ones.times do
      rome += "I"
    end
    return rome
  end
end

RSpec.describe RomanNumerals do
  describe "#roman" do
    it "should return I when given 1" do
      converter = RomanNumerals.new
      expect(converter.roman(1)).to eq("I")
    end
  end
end
