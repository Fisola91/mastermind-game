require "turn_message"
require "mastermind"
require "turn"

RSpec.fdescribe TurnMessage do
  let(:passcode) { ["RED", "GREEN", "BLUE", "YELLOW"] }

  describe ".for" do
    describe "exact position" do
      context "all colors guessed at the exact position" do
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

      context "three colors guessed at the exact position" do
        it "returns a message (three correct guess) to the player" do
          turn = Turn.new(passcode: passcode)
          turn_message = turn.guess(["RED", "GREEN", "BLUE", "ORANGE"])
          expect(described_class.for(turn_message)).to eq("Three correct guess at the exact position")
        end
      end

      context "incorrect guess" do
        it "returns a message (incorrect guess) to the player" do
          turn = Turn.new(passcode: passcode)
          turn_message = turn.guess(["ORANGE", "ORANGE", "ORANGE", "ORANGE"])
          expect(described_class.for(turn_message)).to eq("Incorrect guess")
        end
      end

      context "unimplemented guess" do
        it "returns a message (not implemented) to the player" do
          turn = Turn.new(passcode: passcode)
          expect(described_class.for(turn)).to eq("Result message not implemented: #{turn.inspect}")
        end
      end
    end

    # describe "partial position" do
    #   context "all colors guessed at the wrong position" do
    #     it "returns a message (four partial guesses) to the player" do
    #       turn = Turn.new(passcode: passcode)
    #       turn_message = turn.guess(["YELLOW", "BLUE", "GREEN", "RED"])
    #       expect(described_class.for(turn_message)).to eq("Four colors guessed at the wrong position")
    #     end
    #   end

    end



  end
end
