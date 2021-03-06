class PotsController < ApplicationController
  before_action :require_signin

  def display_new_order_pot
    @prompt = 'Sort by...'
    @pots = Pot.all
    @pots = @pots.send(params[:sort]) unless params[:sort].blank?
  end

  def store_order_pots
    pot_id = params[:pot_id]
    if Pot.exists?(pot_id)
      redirect_to display_new_order_flower_path(pot_id)
    else
      render :display_new_order_pot
    end
  end
end
