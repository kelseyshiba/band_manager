Rails.application.routes.draw do
  resources :songs
  resources :set_lists
  resources :invoices
  resources :gigs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
