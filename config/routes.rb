Rails.application.routes.draw do
  root 'menu#index'
  devise_for :users
  resources :firms do
    resources :comments
    resources :appointments, only: [:create, :index, :destroy, :update]
    resources :lawyers
  end
  resources :menu
  resources :profil
  resources :presentation
end
