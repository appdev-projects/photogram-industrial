Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  # convention is to alphabetize the routes
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/:username', to: 'users#profile', as: 'user_profile'
  # Defines the root path route ("/")
  # root "articles#index"

  
end
