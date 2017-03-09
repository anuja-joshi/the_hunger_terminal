Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :daily_orders, only: [:index]
end
