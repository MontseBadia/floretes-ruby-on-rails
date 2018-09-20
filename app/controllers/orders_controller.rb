class OrdersController < ApplicationController
  before_action :require_signin

  def new
    @order = Order.new
  end

  def create
    @address = params[:order]['address']
    @phone = params[:order]['phone']

    @order = Order.create!(user: current_user, address: @address, phone: @phone, total_price: current_user.total_orders_price_in_cart)
    if @order.valid?
      @order.create_order_pot(current_cart)
      @order.empty_cart
      redirect_to current_user # order confirmation
    else
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
