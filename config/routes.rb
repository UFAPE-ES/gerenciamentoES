Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  devise_for :admins
  #cotrollers:{
  # sessions: 'admins/sessions'
  #}
  devise_for :users
  get 'users/index'
  get 'users/show'
  get 'users/deletar'
  delete "users/:id", to: "users#deletar"
  resources :encomendas
  resources :produtos
  resources :moradors
  resources :funcionarios
  root to: "site/welcome#index"
end
