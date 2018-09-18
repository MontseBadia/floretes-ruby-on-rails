class CartPot < ApplicationRecord
  belongs_to :cart, inverse_of: :cart_pots
  belongs_to :pot

  has_many :cart_flowers, dependent: :destroy, inverse_of: :cart_pot
  has_many :flowers, through: :cart_flowers

  accepts_nested_attributes_for :cart_flowers

  def total_price
    pot.price + cart_flowers.sum(&:total_price)
  end
end
