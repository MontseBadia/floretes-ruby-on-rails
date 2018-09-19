class CartFlower < ApplicationRecord
  belongs_to :cart_pot, inverse_of: :cart_flowers
  belongs_to :flower

  def total_price
    flower.price * units if (flower && units)
  end
end
