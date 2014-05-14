Rails.application.routes.draw do
  
  root to: 'rooms#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/soundcloud', as: 'soundcloud_session'
  get '/auth/logout',  to: 'sessions#logout'
  post '/pusher', to: 'pusher#create'
  get '/pusher', to: 'pusher#show'

  resources :users, only: [:index]
  resources :songs
  resources :rooms
  resource :session, only: [:new, :create, :destroy]
end
