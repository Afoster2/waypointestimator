Rails.application.routes.draw do
  resources :estimates
  resources :options
  resources :boat_models
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

end
