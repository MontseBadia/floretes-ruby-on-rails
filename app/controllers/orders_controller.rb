class OrdersController < ApplicationController

  def new
    @order = Order.new
    @user = current_user
    @carts = @user.carts
  end
  
  def create
    @address = params[:order]["address"] #--> to access hash info!!! :)
    @phone = params[:order]["phone"]
    @cart = current_user.carts.last # need to change
    
    order = Order.create!(user: current_user, address: @address, phone: @phone, total_price: current_user.total_orders_price_in_cart)
    if order.save
      @cart.cart_pots.each do |cart_pot|
        order_pot = OrderPot.create!(order: order, pot: cart_pot.pot)
        cart_pot.cart_flowers.each do |cart_flower|
          OrderFlower.create!(order_pot: order_pot, flower: cart_flower.flower, units: cart_flower.units)
        end
      end
      Cart.destroy_after_created_order(@cart.id)
      redirect_to current_user #order confirmation
    else
      redirect_to new_order_path
    end
  end


  # def create
  #   @user = current_user
  #   @order = Order.create!(user_id: @user.id, pot_ids: params[:pot_id])
    
  #   if @order.save
  #     redirect_to flowers_path	
  #   else 
  #     render :index
  #   end
  # end

  # def show
  #   @order = Order.find(1)
  #   @pots = @order.pots
  #   @order_pots = @order.order_pots
  #   @user = User.find(1)
  # end

end
