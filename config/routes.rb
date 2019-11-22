Rails.application.routes.draw do
  #  devise_for :users, controllers: {
  #    sessions: 'users/sessions'
  #  }
  devise_for :users
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
#root 'users/index'
  root 'movies#index'
get 'welcome/index'
get 'genre/index'
get 'merchandises/index'
get 'merchorders/index'
get 'orders/index'

end
