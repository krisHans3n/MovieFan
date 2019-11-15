Rails.application.routes.draw do
  resources :movieswatcheds
  resources :subplans
  resources :merchorders
  resources :stocks
  resources :merchandises
  resources :orders
  resources :homepages
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'movies#index'
get 'welcome/index'
get 'merchandises/index'
get 'merchorders/index'
get 'orders/index'

end