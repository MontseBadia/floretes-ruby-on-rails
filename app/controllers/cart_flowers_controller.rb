class CartFlowersController < ApplicationController
  def update
    @cart_flower = CartFlower.find(params[:id])
    @cart_flower.update(units: params[:cart_flower]['units'])
  end
end

# ADD FLOWER QUANTITY VALIDATION!!

# pot_capacity = Pot.find(@cart_flower.cart_pot.pot_id).capacity
# flower_units = @cart_flower.cart_pot.cart_flowers.collect { |h| h[:units] }.reduce(:+)

# if pot_capacity >= flower_units
#   @cart_flower.update(units: params[:cart_flower]['units'])
# else
#   flash.now[:alert] = "You have selected to many flowers! Maximum: #{pot_capacity}"
# end