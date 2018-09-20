class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_signin
    redirect_to root_path unless current_user
  end

  def require_admin
    redirect_to root_path unless current_user_admin?
  end

  private

  def current_user_admin?
    current_user && current_user.admin?
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    current_user.cart if current_user
  end

  helper_method :current_user, :current_orders, :current_cart, :current_user_admin?
end
