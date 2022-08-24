class Mastermind
  def initialize(passcode:, input: $stdin, output: $stdout, max_attempts: 3)
    @passcode = passcode
    @correct_answers = 0
    @input = input
    @guess_attempts = 4
    @output = output
  end

  def start
    guess = nil
    current_attempt = 1


  end
end
