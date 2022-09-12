require "mastermind"

RSpec.describe ValidateInput do
  describe ".call" do
    it "raises an error with a value not matching predefined colors" do
      expect { described_class.call(["RED GREEN YELLOW MAGENTA"]) }.to raise_error(UnknownColorError)
    end

    it "raises an error with not enough colors" do
      expect { described_class.call(["RED"]) }.to raise_error(NumberOfColorsError)
    end

    it "raises an error with too many colors" do
      expect { described_class.call(["RED", "GREEN", "YELLOW", "ORANGE", "BLUE"]) }.to raise_error(NumberOfColorsError)
    end

    it "does nothing given correct number of colors" do
      expect(described_class.call(["RED", "GREEN", "YELLOW", "ORANGE"])).to eq nil
    end

    # it "inputs invalid move" do
    #   expect(described_class.call(["A B C D"])).to eq("invalid move")
    # end



  end
end

# context 'when error occures' do
#   it 'should return error message' do
#     allow(Email).to receive(:send_email) { err }
#     expect(Email.send_email).to eq 'Error sent email brand'
#   end
# end
# it "indicates if a dependent gem is not found" do
#   expect {
#     Empiric.get_version("capybara")
#   }.to raise_error NoMethodError
# end
