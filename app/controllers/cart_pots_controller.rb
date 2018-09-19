class CartPotsController < ApplicationController
  before_action :require_signin

  def destroy
    cart_pot = CartPot.find(params[:id])
    cart_pot.destroy
    redirect_to current_user, alert: 'Successfully deleted!'
  end
end
