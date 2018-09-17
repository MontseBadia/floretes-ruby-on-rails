class OrderPotsController < ApplicationController
  def new
    @user = current_user
    @order = Order.create!(user_id: @user.id)
    @pots = Pot.all
    @order_pot = OrderPot.new
  end
  
  def create
    @user = current_user
    @order = User.find(@user.id).orders.last
    @order_pot = OrderPot.new(pot_id: params[:pot_id], order_id: @order.id)    
    if @order_pot.save
      redirect_to new_order_flower_path
    else 
      render :new
    end
  end
  
  # def create
  #   @user = User.find(1)
  #   @order = Order.create!(user_id: 1)
  #   @order_pot = OrderPot.new(pot_id: params[:pot_id], order_id: @order.id)
    
  #   if @order_pot.save
  #     redirect_to flowers_path	
  #   else 
  #     render :index
  #   end
  # end
end
