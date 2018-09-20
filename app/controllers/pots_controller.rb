class PotsController < ApplicationController
  before_action :require_signin
  before_action :require_admin, only: [:index, :new]

  def display_new_order_pot
    @pots = Pot.all
    @cart = current_user.cart
  end

  def store_order_pots
    pot_id = params[:pot_id]
    if Pot.exists?(pot_id)
      redirect_to display_new_order_flower_path(pot_id)
    else
      render :display_new_order_pot
    end
  end

  def index
    @pots = Pot.all
  end

  def new
    @pot = Pot.new
  end
end
