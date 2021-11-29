Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :encomendas
  resources :produtos
  resources :moradors
  resources :funcionarios
  root to: "welcome#index"
end
