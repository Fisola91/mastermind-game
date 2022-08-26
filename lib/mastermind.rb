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
    output.puts "Kindly enter code with color names"
    mastermind_board
  end

  def mastermind_board
    guess_color = nil
    current_attempt = 1
    correct = 0
    while correct < chances
      guess_color = input.split("\n")

       #check if the number of guess_colors are 4

      if guess_color.length != NUMBER_CODE
        raise ArgumentError, "Number of guess_color not completed, try again!!"
      else
        guess_color1 = guess_color[0]
        guess_color2 = guess_color[1]
        guess_color3 = guess_color[2]
        guess_color4 = guess_color[3]
      end

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
