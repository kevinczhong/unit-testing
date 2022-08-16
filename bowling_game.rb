require "rspec"

class BowlingGame
  def test_method
    true
  end

  def score(array)
    sum = 0
    index = 0
    while index < array.length
      if array[index] == "-"
        index += 1
      elsif array[index] == "/"
        sum += 10 - array[index - 1]
        if array[index + 1] == "X"
          sum += 10
        else
          sum += array[index + 1]
        end
        index += 1
      elsif array[index] == "X"
        sum += 10
        if index < array.length - 1
          if array[index + 2] == "/"
            sum += 10
          elsif array[index + 1] == "X"
            sum += 10 + array[index + 2]
            # sum += array[index + 2] + array[index + 3]
          else
            sum += (array[index + 1] + array[index + 2])
          end
        end
        index += 1
      else
        sum += array[index]
        index += 1
      end
    end
    print(sum)
    return sum
  end
end

RSpec.describe BowlingGame do
  describe "#score" do
    it "should return 63 when given [1,5,  4,4,  8,0,  5,3,  0,0,  4,5,  2,3,  8,1,  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, 0, 5, 3, 0, 0, 4, 5, 2, 3, 8, 1, 7, 1, 1, 1])).to eq(63)
    end

    it "should return 63 when given [1,5,  4,4,  8,'-',  5,3,  '-','-',  4,5,  2,3,  8,1,  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "-", 5, 3, "-", "-", 4, 5, 2, 3, 8, 1, 7, 1, 1, 1])).to eq(63)
    end

    it "should return 78 when given [1,5,  4,4,  8,'/',  5,3,  '-','-',  4,5,  2,3,  8,'/',  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "/", 5, 3, "-", "-", 4, 5, 2, 3, 8, "/", 7, 1, 1, 1])).to eq(78)
    end

    it "should return 97 when given [1,5,  4,4,  8,'/',  5,3,  'X',  4,5,  2,3,  8,'/',  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "/", 5, 3, "X", 4, 5, 2, 3, 8, "/", 7, 1, 1, 1])).to eq(97)
    end

    it "should return 101 when given [1,5,  4,4,  8,'/',  5,3,  'X',  4,'/',  2,3,  8,'/',  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "/", 5, 3, "X", 4, "/", 2, 3, 8, "/", 7, 1, 1, 1])).to eq(101)
    end

    it "should return 106 when given [1,5,  4,4,  8,'/',  5,3,  'X',  'X',  2,3,  8,'/',  7,1,  1,1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "/", 5, 3, "X", "X", 2, 3, 8, "/", 7, 1, 1, 1])).to eq(106)
    end

    it "should return 113 when given [1,5,  4,4,  8,'/',  5,3,  'X',  'X',  2,3,  8,'/',  'X',   1, 1]" do
      converter = BowlingGame.new
      expect(converter.score([1, 5, 4, 4, 8, "/", 5, 3, "X", "X", 2, 3, 8, "/", "X", 1, 1])).to eq(113)
    end
  end
end
