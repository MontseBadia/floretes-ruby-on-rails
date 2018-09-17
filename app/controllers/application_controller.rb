class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_orders
      if current_user
        @orders = current_user.orders
      end
    end

    def current_orders_individual_price
      @current_orders_price = []
      total_flower_price = 0
      total_pot_price = 0

      current_orders.each do |order|
        order.pots.each_with_index do |pot, i|
          order.order_pots[i].flowers.each do |flower|
            total_flower_price += flower.price
          end 
          total_pot_price += pot.price
        end
        @current_orders_price << (total_pot_price + total_flower_price).to_i
        total_flower_price = 0
        total_pot_price = 0
      end

      @current_orders_price
    end

    def current_orders_total_price
      current_orders_individual_price.reduce(:+)
    end

    helper_method :current_user, :current_orders, :current_orders_individual_price, :current_orders_total_price
end

