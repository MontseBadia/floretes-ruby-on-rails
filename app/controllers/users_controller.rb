class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]

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
    @orders = @user.orders
  end

  private 
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
