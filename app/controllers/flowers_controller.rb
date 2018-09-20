class FlowersController < ApplicationController
  before_action :require_signin

  def display_new_order_flower
    @flowers = Flower.all
    @cart = current_user.cart
  end

end
