Rails.application.routes.draw do
  root "photos#index"

  # get "/users/:id" => "users#show", as: :user

  devise_for :users

  resources :comments
  resources :likes
  resources :follow_requests
  resources :photos

  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
  #resources :users, only: show

  get "/:username" => "users#show", as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
