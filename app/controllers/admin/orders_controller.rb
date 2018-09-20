class Admin::OrdersController < Admin::AdminController
  def index
    @orders = Order.all
    @buttons_off = true
  end
end
