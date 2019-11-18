Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  resources :addresses
  resources :creditcards
  resources :subscriptionpayments
  resources :merchpayments
  devise_for :users
  resources :movieswatcheds
  resources :subplans
  resources :merchorders
  resources :stocks
  resources :merchandises
  resources :orders
  resources :homepages
  resources :movies
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#root 'users/index'
  root 'movies#index'
get 'welcome/index'
get 'merchandises/index'
get 'merchorders/index'
get 'orders/index'

end
