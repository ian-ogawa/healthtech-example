Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'doctor/:id', :to => "users#show"
  get 'doctors', :to => "users#index"

  resources :bookings, only: [:index, :create, :update]
  # post 'bookings', :to => "bookings#create"
  # resources :users do
  # end
  resources :hospitals
end
