Rails.application.routes.draw do
  
  root to: 'rooms#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/soundcloud', as: 'soundcloud_session'
  get '/auth/logout',  to: 'sessions#logout'

  resources :users
  
  resources :songs
  
  resources :rooms do
    resources :songs, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]

  end
