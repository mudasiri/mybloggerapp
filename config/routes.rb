Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "users#home"

  root 'users#index'

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do 
      resources :comments, only: [:new, :create]
      resources :likes, only: [:index, :create]
    end
  end
end
