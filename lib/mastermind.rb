class Mastermind
  attr_reader :passcode, :input, :guess_attempts, :output
  def initialize(passcode:, input: $stdin, output: $stdout, guess_attempts: 4)
    @passcode = passcode
    # @correct_answers = 0
    @input = input
    @guess_attempts = 4
    @output = output
  end

  def mastermind
    guess = nil
    current_attempt = 1
    correct = 0
    while correct <= guess_attempts
      p guess = input.split("\n")
      p passcode
      guess1 = guess[0]
      guess2 = guess[1]
      guess3 = guess[2]
      guess4 = guess[3]
      current_attempt += 1


      if guess1 == passcode[0]
        correct += 1
      end
      if guess2 == passcode[1]
        correct += 1
      end
      if guess3 == passcode[0]
        correct += 1
      end
      if guess4 == passcode[0]
        correct += 1
      end

      if correct < guess_attempts
        output.puts "missed"
        correct = 0
      else
        output.puts "Congratulations!"
      end


    end
  end
end
