Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  devise_for :admins
  #cotrollers:{
  # sessions: 'admins/sessions'
  #}
  devise_for :funcionarios
  get 'funcionarios/index'
  get 'funcionarios/show'
  get 'funcionarios/deletar'
  delete "funcionarios/:id", to: "funcionarios#deletar"
  resources :encomendas
  resources :produtos
  resources :moradors
  resources :funcionarios
  root to: "site/welcome#index"
end
