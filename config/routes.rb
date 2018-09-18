Rails.application.routes.draw do
  resources :cart_flowers
  resources :cart_pots
  resources :carts
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

  get "order/pots" => "sessions#display_new_order_pot", as: :display_new_order_pot
  post "order/pots" => "sessions#store_order_pots", as: :store_order_pots

  get "order/flowers" => "sessions#display_new_order_flower", as: :display_new_order_flower
  post "order/flowers" => "sessions#store_order_flowers", as: :store_order_flowers

  get "order/add_to_cart" => "sessions#display_order_before_cart", as: :display_order_before_cart
  post "order/add_to_cart" => "sessions#add_order_to_cart", as: :add_order_to_cart

end
