class OrderFlower < ApplicationRecord
  belongs_to :order_pot, inverse_of: :order_flowers
  belongs_to :flower

  def total
    flower.price * units
  end
end
