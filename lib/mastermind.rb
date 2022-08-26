class Mastermind
  attr_reader :passcode, :input, :guess_attempts, :output
  def initialize(passcode:, input: $stdin, output: $stdout, guess_attempts: 4)
    @passcode = passcode
    # @correct_answers = 0
    @input = input
    @guess_attempts = 5
    @output = output
  end

  def mastermind
    guess = nil
    current_attempt = 1
    correct = 0
    while correct < guess_attempts
      guess = input.split("\n")

      if guess.length != 4
        raise ArgumentError, "Number of guess not completed, try again!!"
      end

      guess1 = guess[0]
      guess2 = guess[1]
      guess3 = guess[2]
      guess4 = guess[3]

      #check if the number of guesses are 4


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
