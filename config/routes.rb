Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'doctors', :to => "users#index"
  resources :users do
  end
  resources :hospitals
end
