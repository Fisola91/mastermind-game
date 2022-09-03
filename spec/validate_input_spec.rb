require "mastermind"

RSpec.describe ValidateInput do
  describe ".call" do
    fit "raises an error with a value not matching predefined colors" do
      expect { described_class.call(["RED GREEN YELLOW MAGENTA"]) }.to raise_error(UnknownColorError)
    end

    fit "raises an error with not enough colors" do
      expect { described_class.call(["RED"]) }.to raise_error(NumberOfColorsError)
    end

    fit "raises an error with too many colors" do
      expect { described_class.call(["RED", "GREEN", "YELLOW", "ORANGE", "BLUE"]) }.to raise_error(NumberOfColorsError)
    end

    fit "does nothing given correct number of colors" do
      expect(described_class.call(["RED", "GREEN", "YELLOW", "ORANGE"])).to eq nil
    end
  end
end
