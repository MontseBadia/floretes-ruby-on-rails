Rails.application.routes.draw do
  resources :comments
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

  # patch 'cart_flowers/:id/add' => 'cartflowers#add_units', as: :add_cart_flower
  # patch 'cart_flowers/:id/remove' => 'cartflowers#remove_units', as: :remove_cart_flower

  delete 'cart/empty' => 'carts#empty'

  get 'order/pots' => 'pots#display_new_order_pot', as: :display_new_order_pot
  post 'order/pots' => 'pots#store_order_pots', as: :store_order_pots

  get 'order/pot/:pot_id/flowers' => 'flowers#display_new_order_flower', as: :display_new_order_flower
  post 'order/pot/:pot_id/flowers' => 'carts#store_order_flowers', as: :store_order_flowers

  get 'order/add_to_cart' => 'orders#display_order_before_cart', as: :display_order_before_cart
  post 'order/add_to_cart' => 'orders#add_order_to_cart', as: :add_order_to_cart

  get '404' => 'errors#not_found'
  get '422' => 'errors#unprocessable_entity'
  get '500' => 'errors#server_error'
end
