Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :estimates
  resources :options
  resources :boat_models

  get 'customers/search', to: 'customers#search', as: :search_customers, defaults: { format: 'json' }
  resources :customers
  
  get 'pages/home'
  devise_for :users

  resources :users, only: [:index, :show]

  resources :boat_models do
    get 'options', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

  # Remove this line since it's already defined by `resources :customers`
  # get '/customers/:id', to: 'customers#show', as: 'customer'
  get 'estimates/customers/:id', to: 'customers#show', defaults: { format: 'json' }, as: 'estimates_customer'


  # For boat model options
  get '/boat_models/:id/options', to: 'boat_models#options', as: 'boat_model_options'

end
