require "turn_message"
require "mastermind"
require "turn"

RSpec.fdescribe TurnMessage do
  let(:passcode) { ["RED", "GREEN", "BLUE", "YELLOW"] }

  describe ".for" do
    context "all elements guessed at the exact position" do
      it "returns congratulatory message to the player" do
        turn = Turn.new(passcode: passcode)
        turn_message = turn.guess(["RED", "GREEN", "BLUE", "YELLOW"])
        expect(described_class.for(turn_message)).to eq("Congratulations!")
      end
    end

    context "one color guessed at the exact position" do
      it "returns a message (one correct guess) to the player" do
        turn = Turn.new(passcode: passcode)
        turn_message = turn.guess(["RED", "ORANGE", "ORANGE", "ORANGE"])
        expect(described_class.for(turn_message)).to eq("One correct guess at the exact position")
      end
    end

    context "two colors guessed at the exact position" do
      it "returns a message (two correct guess) to the player" do
        turn = Turn.new(passcode: passcode)
        turn_message = turn.guess(["RED", "GREEN", "ORANGE", "ORANGE"])
        expect(described_class.for(turn_message)).to eq("Two correct guess at the exact position")
      end
    end
  end
end
