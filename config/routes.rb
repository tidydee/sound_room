Rails.application.routes.draw do
  
  root to: 'rooms#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/soundcloud', as: 'soundcloud_session'

  resources :users
  
  resources :songs
  
  resources :rooms do
    resources :songs, only: [:create]
  end

  end
