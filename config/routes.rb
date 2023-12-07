Rails.application.routes.draw do
  # User Routes
  post "/users" => "users#create"
end
