require "turn_message"
require "mastermind"
require "turn"

RSpec.fdescribe TurnMessage do
  let(:passcode) { ["RED", "GREEN", "BLUE", "YELLOW"] }

  describe ".for" do
    context "all elements guessed at the exact position" do
      it "congratulates the player" do
        turn = Turn.new(passcode: passcode)
        turn_message = turn.guess(["RED", "GREEN", "BLUE", "YELLOW"])
        expect(described_class.for(turn_message)).to eq("Congratulations!")
      end
    end
  end
end

# turn = Turn.new(passcode: passcode)
#         feedback = turn.guess(["RED", "ORANGE", "ORANGE", "ORANGE"])
