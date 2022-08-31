require "mastermind"

RSpec.describe Mastermind do
  describe "#mastermind" do
    let(:output) { StringIO.new }

    it "looses all the chances" do
      guesses = ["RED", "GREEN", "BLUE", "YELLOW"]
      input = guesses.join("\n")
      game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

      game.start

      game_output_lines = output.string.split("\n").map(&:strip)
      expect(game.mastermind_board).to eq(["RED", "BLUE", "GREEN", "PURPLE"])
      expect(game_output_lines[3]).to eq "Wrong choice!! Try again. Attempts left: 3"
      expect(game.mastermind_board).to eq(["RED", "BLUE", "GREEN"])
      expect(game_output_lines[3]).to eq "Try again!"
    end


    it "congratulates a player that guesses the entire code in first turn" do
      guesses = ["RED", "GREEN", "BLUE", "YELLOW"]
      input = guesses.join("\n")
      game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

      game.start

      game_output_lines = output.string.split("\n").map(&:strip)
      expect(game_output_lines[3]).to eq "Congratulations!"
    end
  end
end
