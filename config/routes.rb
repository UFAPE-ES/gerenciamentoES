Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :encomendas
  resources :moradors
  resources :funcionarios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
end
