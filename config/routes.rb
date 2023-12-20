Rails.application.routes.draw do
  # User Routes
  post "/users" => "users#create"

  # Session Routes
  post "/sessions" => "sessions#create"

  # Game Routes
  get "/games-fetch" => "games#fetch_data"
  get "/games/:id" => "games#show"
  get "/games" => "games#index"
  post "/games" => "games#create"
  patch "/games/:id" => "games#update"
  delete "/games" => "games#destroy"
end
