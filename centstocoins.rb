require "rspec"

class ChangeMachine
  def change(number)
    c = []
    quarters = (number / 25).floor()
    quarters.times do
      c << 25
    end
    remainder = number % 25
    dimes = (remainder / 10).floor()
    dimes.times do
      c << 10
    end
    remainder = remainder % 10
    nickels = (remainder / 5).floor()
    nickels.times do
      c << 5
    end
    cents = remainder % 5
    cents.times do
      c << 1
    end
    return c
  end
end

RSpec.describe ChangeMachine do
  describe "#change" do
    it "should return [1] when given 1" do
      machine = ChangeMachine.new
      expect(machine.change(1)).to eq([1])
    end

    it "should return [1, 1] when given 2" do
      machine = ChangeMachine.new
      expect(machine.change(2)).to eq([1, 1])
    end

    it "should return [10, 1, 1, 1] when given 13" do
      machine = ChangeMachine.new
      expect(machine.change(13)).to eq([10, 1, 1, 1])
    end

    it "should return [10] when given 10" do
      machine = ChangeMachine.new
      expect(machine.change(10)).to eq([10])
    end

    it "should return [25, 1] when given 26" do
      machine = ChangeMachine.new
      expect(machine.change(26)).to eq([25, 1])
    end

    it "should return [25, 25, 25, 25, 10, 5, 1, 1, 1, 1] when given 119" do
      machine = ChangeMachine.new
      expect(machine.change(119)).to eq([25, 25, 25, 25, 10, 5, 1, 1, 1, 1])
    end
  end
end
