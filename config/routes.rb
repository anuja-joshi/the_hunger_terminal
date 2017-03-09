Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :orders
  resources :companies
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :daily_orders, only: [:index]
  resources :terminals do
    resources :menu_items
  end
end
