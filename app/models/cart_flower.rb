class CartFlower < ApplicationRecord
  belongs_to :cart_pot, inverse_of: :cart_flowers
  belongs_to :flower
end
