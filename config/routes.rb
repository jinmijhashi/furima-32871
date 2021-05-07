Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create]
  get 'items/create', to: 'items#create'
  #end
end