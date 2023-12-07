class GamesController < ApplicationController
  def index
    response = HTTP.get("https://api.rawg.io/api/games?key=3#{ENV["GAME_API_KEY"]}")
  end
end
