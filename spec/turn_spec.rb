require "mastermind"

RSpec.describe Turn do
  let(:passcode) { ["RED", "GREEN", "BLUE", "YELLOW"] }

  describe "#guess" do
    context "no elements guessed right" do
      it "returns an empty array" do
        turn = Turn.new(passcode: passcode)
        feedback = turn.guess(["ORANGE", "ORANGE", "ORANGE", "ORANGE"])
        expect(feedback).to eq []
      end
    end

    context "one element guessed exactly" do
      it "returns one :exact value" do
        turn = Turn.new(passcode: passcode)
        feedback = turn.guess(["RED", "ORANGE", "ORANGE", "ORANGE"])
        expect(feedback).to eq [:exact]
      end
    end

    context "two elements guessed exactly" do
      it "returns two :exact values" do
        turn = Turn.new(passcode: passcode)
        feedback = turn.guess(["RED", "GREEN", "ORANGE", "ORANGE"])
        expect(feedback).to eq [:exact, :exact]
      end
    end

    context "three elements guessed exactly" do
      it "returns three :exact values" do
        turn = Turn.new(passcode: passcode)
        feedback = turn.guess(["RED", "GREEN", "BLUE", "ORANGE"])
        expect(feedback).to eq [:exact, :exact, :exact]
      end
    end

    context "four elements guessed exactly" do
      it "returns four :exact values" do
        turn = Turn.new(passcode: passcode)
        feedback = turn.guess(["RED", "GREEN", "BLUE", "YELLOW"])
        expect(feedback).to eq [:exact, :exact, :exact, :exact]
      end
    end
  end
end
