class CartsController < ApplicationController
  def create
    @pot = Pot.find(session[:pot_id])
    @flower_ids = session[:flower_ids]
    @flower_units = session[:units]

    # @flower_ids.each_with_index do |id, i|
    #   flower = Flower.find(id)
    # end

    # Cart.create!(user: current_user, #check if created properly!
    #   cart_pots_attributes: [pot: @pot, cart_flowers_attributes: [flower: flower, units: @flower_units[i]]])

    if current_user.carts.size === 0
      cart = Cart.create!(user: current_user)
    else 
      cart = current_user.carts.last
    end

    cart_pot = CartPot.create!(cart: cart, pot: @pot)
    @flower_ids.each_with_index do |id, i|
      flower = Flower.find(id)
      cart_flower = CartFlower.create!(cart_pot: cart_pot, flower: flower, units: @flower_units[i])
    end

    session[:pot_id] = nil
    session[:flower_ids] = nil
    session[:units] = nil

    # @flowers = []
    # session[:flower_ids].each do |id|
    #   @flowers << Flower.find(id)
    # end
    # @units = []
    # session[:units].each do |unit|
    #   @units << unit
    # end

    redirect_to current_user
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy 
    redirect_to current_user, alert: "Successfully deleted!"
  end
end
