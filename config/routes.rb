Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get 'months/index'
  get 'future_months/index'

  get "home/index"
  get "about/index"
  
  resources :months do
    resources :expenses
    resources :incomes
  end

  resources :future_months do
    resources :expected_expenses
    resources :expected_incomes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end