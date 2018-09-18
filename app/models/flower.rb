class Flower < ApplicationRecord
  has_many :order_flowers, dependent: :destroy
  has_many :order_pots, through: :order_flowers

  has_many :cart_flowers, dependent: :destroy
  has_many :cart_pots, through: :cart_flower
end
