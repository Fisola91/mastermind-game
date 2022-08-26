class Mastermind
  NUMBER_CODE = 4
  attr_reader :passcode, :input, :chances, :output
  def initialize(passcode:, input: $stdin, output: $stdout, chances: 4)
    @passcode = passcode
    # @correct_answers = 0
    @input = input
    @chances = 4
    @output = output
  end

  def mastermind_board
    guess = nil
    current_attempt = 1
    correct = 0
    while correct < chances
      guess = input.split("\n")

       #check if the number of guesses are 4

      if guess.length != NUMBER_CODE
        raise ArgumentError, "Number of guess not completed, try again!!"
      else
        guess1 = guess[0]
        guess2 = guess[1]
        guess3 = guess[2]
        guess4 = guess[3]
      end

      if guess1 == passcode[0]
        correct += 1
      end
      if guess2 == passcode[1]
        correct += 1
      end
      if guess3 == passcode[2]
        correct += 1
      end
      if guess4 == passcode[3]
        correct += 1
      end

      if guess == passcode
        output.puts "Congratulations!"
      else
        output.puts "missed"
        correct = 0
        current_attempt += 1
      end


    end
  end
end
