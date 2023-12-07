Rails.application.routes.draw do
  # User Routes
  post "/users" => "users#create"

  # Session Routes
  post "/sessions" => "sessions#create"

  # Game Routes
  get "/games-fetch" => "games#fetch_data"
  get "/games/:id" => "games#show"
end
