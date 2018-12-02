Rails.application.routes.draw do
  
  get 'abouts/index'

  match "/images/uploads/*path" => "gridfs#serve", via: [:get, :post]
  resources :users
  resources :gridfs
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'dashboard', to: 'users#index', as: 'dashboard'
 
  root to: 'sessions#new'

  match '*path', to: redirect('/'), via: :all
end
