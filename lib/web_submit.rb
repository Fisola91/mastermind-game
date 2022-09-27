require "ostruct"

class WebSubmit
  def initialize(params)
    @params = params
  end

  def view
    chances = 4
    current_attempt = params[:current_attempt].to_i
    not_lost = true
    next_attempt = current_attempt + 1

    if current_attempt <= chances
      passcode = [params[:code1], params[:code2], params[:code3], params[:code4]]
      guess_colors = [params[:guess1], params[:guess2], params[:guess3], params[:guess4]]
      if guess_colors != [nil, nil, nil, nil]
        begin
          ValidateInput.call(guess_colors)
        rescue UnknownColorError
          next_attempt -= 1
          error_message = "Invalid input, try again!"
        rescue NumberOfColorsError
          next_attempt -= 1
          error_message = "Ensure you enter four colors, try again!"
        end

        if error_message.nil?
          turn = Turn.new(passcode: passcode)
          result = turn.guess(guess_colors)
          message = TurnMessage.for(result)
        end
      end
    else
      next_attempt = nil
      not_lost = false
      message = "You lost, ran out of turns."
    end

    OpenStruct.new(
      chances: chances,
      not_lost: not_lost,
      current_attempt: current_attempt,
      next_attempt: next_attempt,
      error_message: error_message,
      message: message,
    )
  end

  private

  attr_reader :params
end
