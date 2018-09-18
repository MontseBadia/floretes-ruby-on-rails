class OrderFlowersController < ApplicationController

  before_action :require_signin

  def new
    @flowers = Flower.all
    @order_flower = OrderFlower.new
  end

  def create
    flower_ids = params[:flower_ids]
    units = remove_zeros_from_array(params[:units])

    #check if flower ids and units are valid
    session[:flower_ids] = flower_ids
    session[:units] = units
    redirect_to current_user
  end
  
  # def create
  #   @user = current_user
  #   @order_pot = User.find(@user.id).orders.last.order_pots.last
  #   quantities = remove_zeros_from_quantity(params[:units])
  #   flower_ids = params[:flower_id].size

  #   # if flower_ids.size <= 4

  #     params[:flower_id].each_with_index do |flower_id, i| 
  #       quantities[i].to_i.times do
  #         @order_flower = OrderFlower.new(order_pot_id: @order_pot.id, flower_id: flower_id)
  #         @order_flower.save
  #       end
  #       if params[:flower_id].length - 1 === i
  #         redirect_to @user
  #       end
  #     end

  #   # elsif
  #   #   @flowers = Flower.all
  #   #   @order_flower = OrderFlower.new
  #   #   flash.now[:alert] = "Too many flowers selected! Please choose a maximum of 4."
  #   #   render :new
  #   # end

  # end

  def remove_zeros_from_array(array)
    array.delete_if { |x| x == '0' }
  end
  
  # def create
  #   @order_pot = OrderPot.find(5)
  #   @order_flower = OrderFlower.new()
  # end
end
