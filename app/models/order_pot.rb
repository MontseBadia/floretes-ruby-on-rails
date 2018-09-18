class OrderPot < ApplicationRecord
  belongs_to :order, inverse_of: :order_pots
  belongs_to :pot

  has_many :order_flowers, dependent: :destroy, inverse_of: :order_pot
  has_many :flowers, through: :order_flowers

  accepts_nested_attributes_for :order_flowers

  def total
    pot.price + order_flowers.sum(&:total)
  end
end
