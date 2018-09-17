class OrderFlowersController < ApplicationController
  def new
    @flowers = Flower.all
    @order_flower = OrderFlower.new
  end
  
  def create
    @user = current_user
    @order_pot = User.find(@user.id).orders.last.order_pots.last
    params[:flower_id].each_with_index do |flower_id, i| 
      @order_flower = OrderFlower.new(order_pot_id: @order_pot.id, flower_id: flower_id)
      @order_flower.save
      if params[:flower_id].length - 1 === i
        redirect_to @user
      end
    end
  end
  
  # def create
  #   @order_pot = OrderPot.find(5)
  #   @order_flower = OrderFlower.new()
  # end
end
