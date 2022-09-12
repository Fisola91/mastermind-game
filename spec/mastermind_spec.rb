require "mastermind"

RSpec.fdescribe Mastermind do
  describe "#mastermind" do
    let(:output) { StringIO.new }

    context "looses all guess chances" do

      it "looses all the chances" do
        guesses = [
          "ORANGE ORANGE ORANGE ORANGE",
          "RED ORANGE ORANGE ORANGE",
          "RED GREEN ORANGE ORANGE",
          "RED GREEN BLUE ORANGE",
        ]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "Incorrect guess"
          expect(game_output_lines[3]).to eq "One correct guess at the exact position"
          expect(game_output_lines[4]).to eq "Two correct guess at the exact position"
          expect(game_output_lines[5]).to eq "Three correct guess at the exact position"
          expect(game_output_lines[6]).to eq "You lost, ran out of turns."
        end
    end


    context "guess color(s) at exact position" do
      it "congratulates a player that guesses the entire code in first turn" do
        guesses = ["RED GREEN BLUE YELLOW"]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "Congratulations!"
      end

      it "congratulates a player that guesses the entire code in second turn" do
        guesses = ["RED ORANGE PURPLE ORANGE",
                   "RED GREEN BLUE YELLOW"
        ]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "One correct guess at the exact position"
        expect(game_output_lines[3]).to eq "Congratulations!"
      end

      it "congratulates a player that guesses the entire code in third turn" do
        guesses = ["RED ORANGE PURPLE ORANGE",
                   "RED GREEN PURPLE ORANGE",
                   "RED GREEN BLUE YELLOW"
        ]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "One correct guess at the exact position"
        expect(game_output_lines[3]).to eq "Two correct guess at the exact position"
        expect(game_output_lines[4]).to eq "Congratulations!"
      end

      it "congratulates a player that guesses the entire code in last turn" do
        guesses = ["RED ORANGE PURPLE ORANGE",
                   "RED GREEN PURPLE ORANGE",
                   "RED GREEN BLUE ORANGE",
                   "RED GREEN BLUE YELLOW"
        ]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "One correct guess at the exact position"
        expect(game_output_lines[3]).to eq "Two correct guess at the exact position"
        expect(game_output_lines[4]).to eq "Three correct guess at the exact position"
        expect(game_output_lines[5]).to eq "Congratulations!"
      end
    end
    context "game exit" do

      it "exits the game if a player makes invalid move" do
        guesses = ["A B C D"]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "Invalid input, start again!"
      end

      it "exits the game if a player makes invalid move in the second turn" do
        guesses = ["RED ORANGE PURPLE ORANGE",
                   "A B C D"
        ]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "One correct guess at the exact position"
        expect(game_output_lines[3]).to eq "Invalid input, start again!"
      end

      it "exit the game when a player inputs not enough colors" do
        guesses = ["RED ORANGE"]
        input = StringIO.new(guesses.join("\n"))
        game = Mastermind.new(passcode: ["RED", "GREEN", "BLUE", "YELLOW"], input: input, output: output, chances: 4)

        game.start

        game_output_lines = output.string.split("\n").map(&:strip)
        expect(game_output_lines[2]).to eq "Ensure you enter four colors, start again!"
      end

    end


  end
end
