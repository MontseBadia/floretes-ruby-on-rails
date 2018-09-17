class Flower < ApplicationRecord
  has_many :order_flowers, dependent: :destroy
  has_many :order_pots, through: :order_flowers
end
