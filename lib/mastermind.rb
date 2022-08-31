class ValueError < StandardError
end

class Turn
  def initialize(passcode:)
    @passcode = passcode
  end

  def guess(colors)
    result = []
    passcode.each_with_index do |passcode_color, idx|
      if colors[idx] == passcode_color
        result << :exact
      end
    end
    result
  end

  private

  attr_reader :passcode
end

class Mastermind
  NUMBER_CODE = 4
  COLORS = ["RED", "GREEN", "YELLOW", "BLUE", "PURPLE", "ORANGE"]

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
      p guess_colors = player_input.split(" ")

      unless guess_colors.all? { |guess| COLORS.include?(guess) }
        raise ValueError, "Make sure your guess is contained in the COLORS variable"
      end

      if guess_colors.length != NUMBER_CODE
        raise ValueError, "Number of guess_color not completed, try again!!"
      end

      result = Turn.new(passcode: passcode).guess(guess_colors)

      if result == [:exact, :exact, :exact, :exact]
        output.puts "Congratulations!"
      return
      elsif result == [:exact]
        output.puts "One correct"
      elsif result == [:exact, :exact]
        output.puts "Two correct"
      elsif result == [:exact, :exact, :exact]
        output.puts "Three correct"
      elsif result == []
        output.puts "The game doesn't know how to deal with this yet"
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
