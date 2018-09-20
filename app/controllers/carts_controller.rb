class CartsController < ApplicationController
  before_action :require_signin

  def store_order_flowers
    flowers = params[:units].reject { |_key, value| value.to_i.zero? }
    pot = Pot.find(params[:pot_id])
    pot_capacity = pot.capacity
    number_flowers = number_flowers_selected(flowers)
    enough_capacity = enough_capacity?(flowers, pot_capacity)

    if number_flowers && enough_capacity
      current_cart.create_cart_pot(pot, flowers)
      redirect_to current_user
    else
      @flowers = Flower.all
      flash.now[:alert] = 'Please select at least one flower' unless number_flowers
      flash.now[:alert] = 'You have selected to many flowers! Maximum: #{pot_capacity}' unless enough_capacity
      render :display_new_order_flower
    end
  end

  def empty
    current_cart.empty
    redirect_to current_user
  end

  private

  def number_flowers_selected(selection)
    selection.values.map(&:to_i).reduce(:+)
  end

  def enough_capacity?(selection, capacity)
    capacity >= number_flowers_selected(selection).to_i
  end
end
