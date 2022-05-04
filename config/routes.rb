Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  
  resource  :about, only: [:show], controller: "about" 
  resources  :goals
  resource :pages, only: [:show], controller: "pages"
  
  resources :months do
    resources :expenses
    resources :incomes
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
