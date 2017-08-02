Rails.application.routes.draw do
  root to: "static_pages#index"

  devise_for :users

  resources :users, only: [:show, :index] do
    member do
      get :orders, to: "totals#index"
    end
  end
  resources :products, only: [:show, :index]
  resources :orders, only: [:create, :show, :destroy]
end
