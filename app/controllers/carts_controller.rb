class CartsController < ApplicationController
  before_action :require_signin

  def create
    @pot = Pot.find(session[:pot_id])
    @flowers = session[:flowers]

    if current_user.carts.size === 0
      cart = Cart.create!(user: current_user)
    else
      cart = current_user.carts.last
    end

    cart_pot = CartPot.create!(cart: cart, pot: @pot)
    @flowers.each_pair do |key, value|
      CartFlower.create!(cart_pot: cart_pot, flower: Flower.find(key), units: value)
    end

    session[:pot_id] = nil
    session[:flower_ids] = nil
    session[:units] = nil

    redirect_to current_user
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy 
    redirect_to current_user, alert: "Successfully deleted!"
  end
end
