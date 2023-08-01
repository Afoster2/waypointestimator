Rails.application.routes.draw do
  resources :estimates
  resources :options
  resources :boat_models
  resources :customers
  get 'pages/home'
  devise_for :users

  resources :boat_models do
    get 'options', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

end
