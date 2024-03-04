Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :orders, only: [:new, :create]
  resources :items, only: [:destroy]
end