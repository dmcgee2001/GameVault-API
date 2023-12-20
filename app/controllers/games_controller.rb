class GamesController < ApplicationController
  def fetch_data
    page_number = 1
    page_limit = 100

    while page_number <= page_limit
      response = HTTP.get("https://api.rawg.io/api/games?key=#{ENV["GAME_API_KEY"]}&page=#{page_number}")

      if response.code == 200
        games_data = JSON.parse(response.body)

        games_data["results"].each do |game_data|
          begin
            game = Game.find_or_initialize_by(api_id: game_data["id"])

            game.name = game_data["name"]
            game.released = game_data["released"]
            game.background_image = game_data["background_image"]

            game.save!
          rescue StandardError => e
            Rails.logger.error("Failed to save game #{game_data["name"]}: #{e.message}")
            next # Continue to the next game if there's an error
          end
        end

        page_number += 1
      else
        render json: { error: "Failed to fetch games from the API" }, status: :unprocessable_entity
        break # Break the loop if there's an error in fetching data
      end
    end

    render json: { message: "Games fetched and stored successfully" }
  rescue HTTP::Error, JSON::ParserError => my_errors
    render json: { error: my_errors.message }, status: :unprocessable_entity
  end

  def index
    @games = Game.all
    render :index
  end

  def show
    @game = Game.find_by(id: params[:id])

    if @game.nil?
      render json: { error: "Game not found" }, status: :not_found
      return
    end

    if @game.description.nil? || @game.description.empty?
      begin
        description_response = HTTP.get("https://api.rawg.io/api/games/#{@game.api_id}?key=#{ENV["GAME_API_KEY"]}")

        if description_response.code == 200
          game_description = JSON.parse(description_response.body)
          clean_description = ActionController::Base.helpers.strip_tags(game_description["description"])
          clean_description = clean_description.gsub(/\n/, "").strip

          @game.description = clean_description
          @game.save!
        else
          Rails.logger.error("Failed to fetch description for game ID: #{params[:id]}")
        end
      rescue StandardError => e
        Rails.logger.error("Error fetching description for game ID #{params[:id]}: #{e.message}")
      end
    end

    render :show
  end

  def create
    @game = Game.new(
      name: params["name"],
      released: params["released"],
      background_image: params["background_image"],
      description: params["description"],
    )
    render :show
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(
      name: params["name"] || @game.name,
      released: params["released"] || @game.released,
      background_image: params["background_image"] || @game.background_image,
      description: params["description"] || @game.description,
    )
    render :show
  end
end
