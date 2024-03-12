Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    member do
      get 'order'
    end

    resources :orders, only: [:index, :create]
  end

  root to: 'items#index'
end
