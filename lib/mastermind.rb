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
    output.puts "Kindly enter your guess for the four letter code"
    mastermind_board
  end

  private

  def mastermind_board
    guess_colors = nil
    current_attempt = 1

    while current_attempt <= chances
      player_input = input.gets.to_s.strip
      guess_colors = player_input.split(" ")




      begin
        ValidateInput.call(guess_colors)
      rescue UnknownColorError
        output.puts "Invalid input, try again!"
        redo
      rescue NumberOfColorsError
        output.puts "Ensure you enter four colors, try again!"
        redo
      end

      # If you made an invalid move
      # throw a rescue but don't quit the game
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
