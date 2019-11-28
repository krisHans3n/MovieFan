Rails.application.routes.draw do
  resources :lineitems
  resources :carts
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :addresses
  resources :creditcards
  resources :subscriptionpayments
  resources :merchpayments
  resources :movieswatcheds
  resources :merchorders
  resources :merchandises
  resources :orders
  resources :homepages
  resources :movies
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'movies/index'
  post 'movieswatcheds/addrecords'
get 'welcome/index'
get 'genre/index'
get 'merchandises/index'
get 'merchorders/index'
get 'orders/index'
root 'sessions#new'


end
