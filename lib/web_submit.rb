require "ostruct"
require_relative "web_ui"

class WebSubmit
  def initialize(params)
    @params = params
  end

  def view
    chances = 4
    current_attempt = params[:current_attempt].to_i
    previous_attempt = current_attempt - 1
    not_lost = true
    next_attempt = current_attempt + 1
    won = false

    if previous_attempt <= chances
      passcode = [params[:code1], params[:code2], params[:code3], params[:code4]]
      guess_colors = [
        params.dig("attempts", previous_attempt.to_s, "guess1"),
        params.dig("attempts", previous_attempt.to_s, "guess2"),
        params.dig("attempts", previous_attempt.to_s, "guess3"),
        params.dig("attempts", previous_attempt.to_s, "guess4")
      ]
      if guess_colors != [nil, nil, nil, nil]
        begin
          ValidateInput.call(guess_colors)
        rescue UnknownColorError
          next_attempt -= 1
          error_message = "Invalid input, try again!"
        end

        if error_message.nil?
          turn = Turn.new(passcode: passcode)
          result = turn.guess(guess_colors)
          if result == [:exact, :exact, :exact, :exact]
            won = true
          end
          message = TurnMessage.for(result)
        end
      end
    else
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
      colors: WebUI.new.colors,
      won: won,
      params: params,
    )
  end

  private

  attr_reader :params
end
