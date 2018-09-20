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

  namespace :admin do
    resources :pots
    resources :flowers
    resources :orders
    resources :users

    get 'privileges' => 'pages#privileges'
    patch 'pots/:id/edit' => 'pots#update'
    delete 'pots/:id' => 'pots#destroy'
  end

  get 'signin' => 'sessions#new'
  get 'signup' => 'users#new'
  root 'pages#home'

  delete 'cart/empty' => 'carts#empty'

  get 'order/pots' => 'pots#display_new_order_pot', as: :display_new_order_pot
  post 'order/pots' => 'pots#store_order_pots', as: :store_order_pots

  get 'order/:pot_id/flowers' => 'flowers#display_new_order_flower', as: :display_new_order_flower
  post 'order/:pot_id/flowers' => 'carts#store_order_flowers', as: :store_order_flowers

  get 'order/add_to_cart' => 'orders#display_order_before_cart', as: :display_order_before_cart
  post 'order/add_to_cart' => 'orders#add_order_to_cart', as: :add_order_to_cart
end
