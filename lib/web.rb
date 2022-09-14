require "sinatra/base"
require "sinatra/reloader"
require_relative "turn"
require_relative "turn_message"
require_relative "validate"

require_relative "web_ui"

class WebGame < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @view = WebUI.new
    slim :index
  end

  get "/new-game" do
    passcode = ["RED", "GREEN", "BLUE", "YELLOW"]
    redirect to("/game/#{passcode[0]}/#{passcode[1]}/#{passcode[2]}/#{passcode[3]}?current_attempt=1")
  end

  get "/game/:code1/:code2/:code3/:code4" do
    @chances = 4
    @current_attempt = params[:current_attempt].to_i
    @not_lost = true

    if @current_attempt <= @chances
      passcode = [params[:code1], params[:code2], params[:code3], params[:code4]]
      guess_colors = [params[:guess1], params[:guess2], params[:guess3], params[:guess4]]
      if guess_colors != [nil, nil, nil, nil]
        begin
          ValidateInput.call(guess_colors)
        rescue UnknownColorError
          @error_message = "Invalid input, try again!"
        rescue NumberOfColorsError
          @error_message = "Ensure you enter four colors, try again!"
        end

        if @error_message.nil?
          turn = Turn.new(passcode: passcode)
          result = turn.guess(guess_colors)
          @message = TurnMessage.for(result)
        end
      end
    else
      @not_lost = false
      @message = "You lost, ran out of turns."
    end
    slim :guess
  end
end
