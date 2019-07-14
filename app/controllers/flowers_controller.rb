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

  def index
    @flowers = Flower.includes(:comments).all
    # render json: @flowers
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @flowers }
    end
  end

  def show
    @flower = Flower.find(params[:id])
    @comments = @flower.comments
  end

  def update
    @flower = Flower.find(params[:id])
    @comment = @flower.create_comment(params[:comments], current_user)
  end
end
