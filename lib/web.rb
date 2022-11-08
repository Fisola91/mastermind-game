require "sinatra/base"
require "sinatra/reloader"
require_relative "turn"
require_relative "turn_message"
require_relative "validate"
require "pry"
require_relative "web_ui"
require_relative "web_submit"

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
    redirect to("/game/#{passcode[0]}/#{passcode[1]}/#{passcode[2]}/#{passcode[3]}?current_attempt=0")
  end

  get "/game/:code1/:code2/:code3/:code4" do
    action = WebSubmit.new(params)
    @view = action.view
    @params = params
    slim :guess
  end
end
