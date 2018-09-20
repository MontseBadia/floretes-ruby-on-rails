class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_pots, dependent: :destroy, inverse_of: :cart
  has_many :pots, through: :cart_pots

  accepts_nested_attributes_for :cart_pots

  def total_price
    cart_pots.sum(&:total_price)
  end

  def create_cart_pot(pot, flowers)
    cart_pot = cart_pots.create(pot: pot)
    cart_pot.create_carts_flowers(flowers)
  end

  def empty
    cart_pots.destroy_all
  end
end
