class FlowersController < ApplicationController
  before_action :require_signin

  def display_new_order_flower
    @prompt = 'Sort by...'
    @prompt_country = 'Select origin...'
    @prompt_color = 'Select color...'
    @flowers = Flower.all

    @flowers = @flowers.send(params[:sort]) unless params[:sort].blank?
    @flowers = @flowers.location(params[:filter_country]) unless params[:filter_country].blank?
    @flowers = @flowers.color(params[:filter_color]) unless params[:filter_color].blank?
  end
end
