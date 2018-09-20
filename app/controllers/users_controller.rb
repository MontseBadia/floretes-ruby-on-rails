class UsersController < ApplicationController
  before_action :require_signin, except: %i[new create]

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
    @orders = current_user.orders
    @delete_cart = true
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
