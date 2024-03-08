Rails.application.routes.draw do
  devise_for :users

  root 'orders#index'

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    member do
      get 'order_form'
    end

    resources :orders, only: [:index, :create, :new] do
      post 'item_orders', on: :collection
    end
  end
end
