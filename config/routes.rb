Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :index, :show]
  get '/new_item', to: 'items#new', as: 'new_item_pass'


  get '/new_item_page', to: 'items#new', as: 'new_item_page'
end