class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to current_user
    else
      flash.now[:alert] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end  
  
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
    flower_ids = params[:flower_ids]
    units = remove_zeros_from_array(params[:units])
  
    session[:flower_ids] = flower_ids
    session[:units] = units
    redirect_to display_order_before_cart_path
  end

  def display_order_before_cart
    @pot = Pot.find(session[:pot_id])
    @flowers = []
    session[:flower_ids].each do |id|
      @flowers << Flower.find(id)
    end
    @units = []
    session[:units].each do |unit|
      @units << unit
    end
    @total_order_price = total_order_price_before_cart(@pot, @flowers, @units)
  end




  
  private
  
  def self.exists?
    Pot.find(id)   
  end

  def remove_zeros_from_array(array)
    array.delete_if { |x| x == '0' }
  end

  def total_order_price_before_cart(pot, flowers, units)
    total_flowers = 0
    flowers.each_with_index { |x, i| total_flowers += x.price.to_i * units[i].to_i }
    pot.price + total_flowers
  end

end
