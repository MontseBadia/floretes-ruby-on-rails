Rails.application.routes.draw do
  resources :order_flowers
  resources :order_pots
  resources :orders
  resources :flowers
  resources :pots
  resources :users
  resource :session
  
  get "signin" => "sessions#new"
  get "signup" => "users#new"
  root "pages#home"   
end
