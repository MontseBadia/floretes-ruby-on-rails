class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thanks for signing up to Floretes!'
    else
      render :new
    end
  end

  def show
    @user = current_user
    @carts = @user.carts




    # @pot = Pot.find(session[:pot_id])
    # @flowers = []
    # session[:flower_ids].each do |id|
    #   @flowers << Flower.find(id)
    # end
    # @units = []
    # session[:units].each do |unit|
    #   @units << unit
    # end

  end

  private 
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
