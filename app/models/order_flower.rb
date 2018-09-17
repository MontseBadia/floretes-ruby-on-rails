class OrderFlower < ApplicationRecord
  belongs_to :order_pot
  belongs_to :flower
end
