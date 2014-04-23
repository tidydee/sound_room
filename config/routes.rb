Rails.application.routes.draw do
  
  resources :users
  
  resources :songs
  
  resources :rooms 

  root to: 'rooms#index'
  end
