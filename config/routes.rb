Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#splash'

  resources :budgets, only: [:index, :show, :new, :create] do
    resources :expenses, only: [:new, :create]
  end
end
