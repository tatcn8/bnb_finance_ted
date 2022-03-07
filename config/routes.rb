Rails.application.routes.draw do
  root to: 'pages#home'
  
  get 'months/index'
  get 'future_months/index'

  get "home/index"
  
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