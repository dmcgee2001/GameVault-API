Rails.application.routes.draw do
  # User Routes
  post "/users" => "users#create"

  # Session Routes
  post "/sessions" => "sessions#create"

  # Game Routes
  get "/games-fetch" => "games#fetch_data"
  get "/data-fetch" => "games#populate_descriptions"
  get "/games/:id" => "games#show"
  get "/games" => "games#index"
  post "/games" => "games#create"
  patch "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"

  # Collection Routes
  get "/collections/:id" => "collections#show"
  get "/collections" => "collections#index"
  post "/collections" => "collections#create"
  patch "/collections/:id" => "collections#update"
  delete "/collections/:id" => "collections#destroy"
end
