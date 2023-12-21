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

  # Collection Routes
  get "/collections/:id" => "collections#show"
  get "/collections" => "collections#index"
  post "/collections" => "collections#create"
  patch "/collections/:id" => "collections#update"
  delete "/collections" => "collections#destroy"
end
