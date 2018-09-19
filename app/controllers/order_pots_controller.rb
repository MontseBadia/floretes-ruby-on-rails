class OrderPotsController < ApplicationController
  before_action :require_signin

  def create
    pot_id = params[:pot_id]

    if Pot.find(pot_id)
      session[:pot_id] = pot_id
      redirect_to new_order_flower_path
    else
      render :new
    end
  end
end
