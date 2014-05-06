Rails.application.routes.draw do
  
  root to: 'rooms#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/soundcloud', as: 'soundcloud_session'
  get '/auth/logout',  to: 'sessions#logout'
  post '/pusher', to: 'pusher#create'
  get '/pusher', to: 'pusher#show'

  resources :users
  
  resources :songs

  # resources :rooms, only: [:index, :create, :show, :destroy]
  
  resources :rooms
  # do
  #   resources :songs, only: [:index, :create, :destroy]
  # end

  resource :session, only: [:new, :create, :destroy]

  end
