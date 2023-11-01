Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "photos#index"
  

  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos

  get ":username/liked" => "photos#liked", as: :liked_photos
  # TODO
  # get ":username/feed"
  # get ":username/followers"
  # get ":username/following"
  # Must be at end
  get "/:username" => "users#show", as: :user
end
