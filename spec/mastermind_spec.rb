require "mastermind"

RSpec.describe Mastermind do
  describe "#mastermind" do
    let(:output) { StringIO.new }

    it "won all guesses" do
      guesses = ["RED", "GREEN", "BLUE", "YELLOW"]
      input = guesses.join("\n")
      game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

      game.mastermind_board

      game_output_lines = output.string.split("\n").map(&:strip)
      # expect { output.mastermind }.to raise_error(ArgumentError, "Number of guess not completed, try again!!")
      expect(game_output_lines[0]).to eq "Congratulations!"
    end
  end
end
