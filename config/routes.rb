Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    member do
      get 'order'
    end
    resources :orders, only: [:index, :create]
  end
end
