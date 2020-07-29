Rails.application.routes.draw do
  resources :songs
  resources :set_lists
  resources :invoices, only: [:index, :new, :show, :edit, :update, :destroy]
  resources :gigs
  
  resources :users do 
    resources :gigs, only: [:index, :show]
    resources :invoices, only: [:index]
  end

  #Login/SignUp Routes
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  
  
  #Main Routes
  get '/', to: 'sessions#home'
  root 'sessions#home'
  get '/main', to: 'users#main'

  #OAuth Routes
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  post '/auth/google_oauth2', to: 'sessions#omniauth'
  post '/auth/facebook', to: 'sessions#omniauth'

  #Other Routes
  get '*path', to: 'application#not_found'
  #redirect { |route, req| req.flash[:error] = “The URL \“/#{route[:path]}\” Was Not Found!“; ‘/’ }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
