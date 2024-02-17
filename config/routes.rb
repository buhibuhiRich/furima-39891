Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :prototypes
  
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end