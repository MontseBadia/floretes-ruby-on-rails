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

  def current_orders
    if current_user
      @orders = current_user.orders
    end
  end

  def current_cart
    if current_user
      @cart = current_user.cart
    end
  end

  helper_method :current_user, :current_orders, :current_orders_individual_price,
    :current_orders_total_price, :current_cart, :current_user_admin?
end
