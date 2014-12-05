Rails.application.routes.draw do
  devise_for :users
  root to: "welcomes#index"

  get "search", to: "flats#search"
  get "myflats", to: "flats#myflats"
  get "profile", to: "users#show"

  resources :flats do
   resources :bookings, only: [:new, :create]
   resources :pictures, only: [:new, :create, :destroy]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :comments, only: [:new, :create, :destroy]
  end
end
