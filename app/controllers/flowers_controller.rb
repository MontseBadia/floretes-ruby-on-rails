class FlowersController < ApplicationController
  # def index
  #   @flowers = Flower.all
  #   @order_pot = OrderPot.new
  # end

  def display_new_order_pot
    @pots = Pot.all
  end
  
  def store_order_pots
    pot_id = params[:pot_id]
    if Pot.exists?(pot_id)
      session[:pot_id] = pot_id
      redirect_to display_new_order_flower_path
    else
      render :display_new_order_pot
    end
  end

  def display_new_order_flower
    @flowers = Flower.all
  end
  
  def store_order_flowers #check if flower ids are correct?

    session[:flowers] = params[:units].reject { |key, value| value.to_i.zero? }
    redirect_to display_order_before_cart_path

    # if (flower_ids && units.size != 0 && units.size == flower_ids.size)
    #   session[:flower_ids] = flower_ids
    #   session[:units] = units
    #   redirect_to display_order_before_cart_path
    # else
    #   @flowers = Flower.all
    #   flash.now[:alert] = "Please select a flower/flowers and specify its/their quantity"
    #   render :display_new_order_flower
    # end
  end

  def display_order_before_cart
    @pot = Pot.find(session[:pot_id])
    @flowers = session[:flowers].map do |k, v|
      { flower: Flower.find(k), units: v.to_i }
    end

    @total_order_price = @pot.price + @flowers.collect { |h| h[:flower].price * h[:units] }.reduce(:+)

  end




end

