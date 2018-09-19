class OrdersController < ApplicationController
  before_action :require_signin

  def new
    @order = Order.new
    @user = current_user
    @carts = @user.carts
  end

  def create
    @address = params[:order]['address'] #--> to access hash info!!! :)
    @phone = params[:order]['phone']
    @cart = current_user.carts.last # need to change

    @order = Order.new(user: current_user, address: @address, phone: @phone, total_price: current_user.total_orders_price_in_cart)
    if @order.save
      @cart.cart_pots.each do |cart_pot|
        order_pot = OrderPot.create!(order: @order, pot: cart_pot.pot)
        cart_pot.cart_flowers.each do |cart_flower|
          OrderFlower.create!(order_pot: order_pot, flower: cart_flower.flower, units: cart_flower.units)
        end
      end
      Cart.destroy_after_created_order(@cart.id)
      redirect_to current_user # order confirmation
    else
      @carts = current_user.carts
      render :new
    end
  end

  def display_order_before_cart
    @pot = Pot.find(session[:pot_id])
    @flowers = session[:flowers].map do |k, v|
      { flower: Flower.find(k), units: v.to_i }
    end

    @total_order_price = @pot.price + @flowers.collect { |h| h[:flower].price * h[:units] }.reduce(:+)
  end
end
