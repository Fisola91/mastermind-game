require_relative "constant_variable"
require_relative "validate"
require_relative "turn"

class Mastermind

  include ColorsAndCodeNumber

  attr_reader :passcode, :input, :chances, :output

  def initialize(passcode:, input: $stdin, output: $stdout, chances: 4)
    @passcode = passcode
    @input = input
    @chances = 4
    @output = output
  end

  def start
    output.puts "Welcome to the mastermind game"
    output.puts "Kindly enter code with color names"
    mastermind_board
  end

  private

  def mastermind_board
    guess_colors = nil
    current_attempt = 1

    while current_attempt <= chances
      player_input = input.gets.to_s.strip
      guess_colors = player_input.split(" ")

      ValidateInput.call(guess_colors)

      result = Turn.new(passcode: passcode).guess(guess_colors)

      if result == [:exact, :exact, :exact, :exact]
        output.puts "Congratulations!"
      return
      elsif result == [:exact]
        output.puts "One correct guess at the exact position"
      elsif result == [:exact, :exact]
        output.puts "Two correct guess at the exact position"
      elsif result == [:exact, :exact, :exact]
        output.puts "Three correct guess at the exact position"
      elsif result == []
        output.puts "Incorrect guess"
      end
      current_attempt += 1
    end
    output.puts "You lost, ran out of turns."
  end
end

# Codemaker makes code of color peg and close
# Codebreaker places color pegs on the empty board
# Once the codebreaker finished, the codemaker must provide feedback
# to the codebreaker as the how close the code is close
# using the tiny peg, the code maker indicates what information is correct
# For each color that corresponds(right position), use right peg
# if the color of the peg is correct, but different position, use white peg
# if the information is correct, no peg is used.
# Position of the peg does indicate which is cokor is in the right order
# Once the code breaker has matched hidden code identically, the codemaker reveal the code
# It counts how many rows it took codebreaker to solve the code
# The codemaker receives that mini-point------LATER
# If the code


# If any of the guess matches the passcode in the right position,
#  if passcode
