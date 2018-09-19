class FlowersController < ApplicationController
  before_action :require_signin

  def display_new_order_flower
    @flowers = Flower.all
  end

  def store_order_flowers
    session[:flowers] = params[:units].reject { |_key, value| value.to_i.zero? }

    if flowers_selected?(session[:flowers])
      redirect_to display_order_before_cart_path
    else
      @flowers = Flower.all
      flash.now[:alert] = 'Please select at least one flower'
      render :display_new_order_flower
    end
  end

  private

  def flowers_selected?(selection)
    total = 0
    selection.each_pair { |_k, v| total += v.to_i }
    total != 0
  end
end
