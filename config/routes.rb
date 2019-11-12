Rails.application.routes.draw do
  resources :homepages
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'movies#index'
get 'welcome/index'

end
