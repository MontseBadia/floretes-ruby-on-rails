class OrderPot < ApplicationRecord
  belongs_to :order
  belongs_to :pot

  has_many :order_flowers, dependent: :destroy
  has_many :flowers, through: :order_flowers
end
