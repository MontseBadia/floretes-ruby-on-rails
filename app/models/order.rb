class Order < ApplicationRecord
  belongs_to :user

  has_many :order_pots, dependent: :destroy, inverse_of: :order
  has_many :pots, through: :order_pots
  has_many :cart_pots, dependent: :destroy, inverse_of: :cart
  has_many :pots, through: :cart_pots

  accepts_nested_attributes_for :order_pots
  accepts_nested_attributes_for :cart_pots

  validates :total_price, numericality: {greater_than: 0}
  validates :phone, length: { minimum: 6, maximum: 15 }, format: {
    with: /\d[0-9]\)*\z/, 
    message: "allows only positive numbers without spaces"
  }
  validates :address, presence: true #--> make a model out of this!

  def total
    order_pots.sum(&:total)
  end

  def create_order_pot(cart)
    cart.cart_pots.each do |cart_pot|
      order_pot = order_pots.create(pot: cart_pot.pot)
      order_pot.create_orders_flowers(cart_pot.cart_flowers) #check if valid!
    end
  end

  def empty_cart
    user.cart.empty
  end
end
