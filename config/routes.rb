Rails.application.routes.draw do

  root 'application#index'
  get '/about', to: 'application#about'
  get '/contact',to: 'application#contact'
  devise_for :users

  resources :listings
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/users', to: 'users#index', as: 'user_index'

end
