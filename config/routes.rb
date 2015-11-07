Rails.application.routes.draw do

  devise_for :users
  root 'application#index'

  resources :listings
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/users', to: 'users#index', as: 'user_index'

end
