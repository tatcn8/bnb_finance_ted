Rails.application.routes.draw do
  get 'months/index'
  root "months#index"

  get "home/index"
  
  resources :months do
    resources :expenses
    resources :incomes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end