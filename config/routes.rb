Rails.application.routes.draw do

  root "photos#index"
  
  #resources :users, only: [:show]
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  get ":username/liked" => "users#liked", as: :liked, constraints: {username: /.*/}
  get ":username/feed" => "users#feed", as: :feed, constraints: {username: /.*/}
  get ":username/followers" => "users#followers", as: :followers, constraints: {username: /.*/}
  get ":username/following" => "users#following", as: :following,constraints: {username: /.*/}
  get ":username" => "users#show", as: :user, constraints: {username: /.*/}

end
