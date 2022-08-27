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

  def start
    output.puts "Welcome to the mastermind game"
    output.puts "hint: color duplicate is not allowed"
    output.puts "Kindly enter code with color names"
    mastermind_board
  end

  def mastermind_board
    guess_color = nil
    current_attempt = 1
    correct = 0 #correct will track if we get our guess correctly

    while correct < chances
      p guess_color = input.split("\n")


       #check if the number of guess_colors are 4

      if guess_color.length != NUMBER_CODE
        raise ArgumentError, "Number of guess_color not completed, try again!!"
      else
        guess_color1 = guess_color[0]
        guess_color2 = guess_color[1]
        guess_color3 = guess_color[2]
        guess_color4 = guess_color[3]
      end

      # guess_color.each_with_index do |guess, idx|
      #   if guess_color[idx] == passcode[idx]
      #     correct += 1
      #   end
      # end

      if guess_color1 == passcode[0]
        correct += 1
      end
      if guess_color2 == passcode[1]
        correct += 1
      end
      if guess_color3 == passcode[2]
        correct += 1
      end
      if guess_color4 == passcode[3]
        correct += 1
      end

      if guess_color == passcode
        output.puts "Congratulations!"
      else
        output.puts "missed"
        correct = 0
        current_attempt += 1
      end


    end
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
