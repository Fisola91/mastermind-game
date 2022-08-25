require "mastermind"

RSpec.describe Mastermind do
  describe "#start" do
    let(:output) { StringIO.new }

    it "won all guesses" do
      guesses = ["RED", "GREEN", "BLUE", "YELLOW"]
      input = String.new(guesses.join("\n"))
      game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, guess_attempts: 4)

      game.mastermind

      game_output_lines = output.string.split("\n").map(&:strip)
      expect(game_output_lines[0]).to eq "Congratulations!"
    end
  end
end
