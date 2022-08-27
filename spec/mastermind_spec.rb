require "mastermind"

RSpec.describe Mastermind do
  describe "#mastermind" do
    let(:output) { StringIO.new }
    colors = ["RED", "GREEN", "YELLOW", "BLUE", "BLACK", "ORANGE"]

    # it "takes one correct guess in the right position, one incorrect guess and two correct guesses but different position" do
    #   guesses = ["RED", "GREEN", "BLUE", "PURPLE"]
    #   input = guesses.join("\n")
    #   game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

    #   game.start

    #   game_output_lines = output.string.split("\n").map(&:strip)
    #   # expect { output.mastermind }.to raise_error(ArgumentError, "Number of guess not completed, try again!!")
    #   expect(game_output_lines[2]).to eq "Congratulations!"
    # end

    fit "won all guesses" do
      guesses = ["RED", "GREEN", "BLUE", "YELLOW"]
      input = guesses.join("\n")
      game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

      game.start

      game_output_lines = output.string.split("\n").map(&:strip)
      # expect { output.mastermind }.to raise_error(ArgumentError, "Number of guess not completed, try again!!")
      expect(game_output_lines[3]).to eq "Congratulations!"
    end
  end
end
