Rails.application.routes.draw do
  # User Routes
  post "/users" => "users#create"

  # Session Routes
  post "/sessions" => "sessions#create"

  # Game Routes
  get "/games" => "games#index"
  get "/games/:id" => "games#show"
end
