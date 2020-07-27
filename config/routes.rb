Rails.application.routes.draw do
  resources :songs
  resources :set_lists
  resources :invoices
  resources :gigs
  resources :users, only: [:show]
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get '/', to: 'sessions#home'
  root 'sessions#home'

  get '/main', to: 'users#main'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  post '/auth/google_oauth2', to: 'sessions#omniauth'
  post '/auth/facebook', to: 'sessions#omniauth'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
