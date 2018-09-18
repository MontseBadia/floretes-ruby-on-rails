class Pot < ApplicationRecord
  has_many :order_pots, dependent: :destroy
  has_many :orders, through: :order_pots

  has_many :cart_pots, dependent: :destroy
  has_many :carts, through: :cart_pots

  def self.exists?(id)
    Pot.find(id) ? true : false #it never reaches false here! ---!
  end

end
