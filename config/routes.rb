Rails.application.routes.draw do
  root to: "static_pages#index"

  devise_for :users

  resources :products, only: :show
  resources :orders, only: [:create, :destroy]
end
