class OrderPot < ApplicationRecord
  belongs_to :order, inverse_of: :order_pots
  belongs_to :pot

  has_many :order_flowers, dependent: :destroy, inverse_of: :order_pot
  has_many :flowers, through: :order_flowers

  accepts_nested_attributes_for :order_flowers

  def total
    pot.price + order_flowers.sum(&:total)
  end

  def create_orders_flowers(cart_flowers)
    cart_flowers.each { |cart_flower| order_flowers.create(flower: cart_flower.flower, units: cart_flower.units) }
  end
end
