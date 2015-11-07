Rails.application.routes.draw do

  root 'application#index'
  devise_for :users

  resources :listings
  resources :messages
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/users', to: 'users#index', as: 'user_index'

end
