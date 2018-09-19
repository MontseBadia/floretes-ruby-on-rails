class OrderFlowersController < ApplicationController
  before_action :require_signin

  def create
    flower_ids = params[:flower_ids]
    units = remove_zeros_from_array(params[:units])

    #check if flower ids and units are valid
    session[:flower_ids] = flower_ids
    session[:units] = units
    redirect_to current_user
  end

  def remove_zeros_from_array(array)
    array.delete_if { |x| x == '0' }
  end
end
