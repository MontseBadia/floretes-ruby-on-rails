class CartPotsController < ApplicationController

  def destroy
    cart_pot = CartPot.find(params[:id])
    cart_pot.destroy 
    redirect_to current_user, alert: "Successfully deleted!"
  end

end
