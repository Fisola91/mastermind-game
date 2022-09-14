require "sinatra/base"
require "sinatra/reloader"

require_relative "web_ui"

class WebGame < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @view = WebUI.new
    slim :index
  end
end
