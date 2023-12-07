class GamesController < ApplicationController
  def index
    response = HTTP.get("https://api.rawg.io/api/games?key=#{ENV["GAME_API_KEY"]}")
    data = JSON.parse(response)
    render json: data
  end
end
