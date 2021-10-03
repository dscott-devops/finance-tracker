Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:destroy]
  devise_for :users
  root 'welcome#index'
  get 'portfolio', to: 'users#portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'users#friends'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
