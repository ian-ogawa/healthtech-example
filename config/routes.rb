Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'doctor/:id', :to => "users#show"
  get 'doctors', :to => "users#index"

  resources :bookings, only: [:index, :create, :update]
  resources :hospitals, only: [:index, :show] do
  	post 'add_hospitals'
  end
end
