class Order < ApplicationRecord
  belongs_to :user

  has_many :order_pots, dependent: :destroy, inverse_of: :order
  has_many :pots, through: :order_pots

  accepts_nested_attributes_for :order_pots

  has_many :cart_pots, dependent: :destroy, inverse_of: :cart
  has_many :pots, through: :cart_pots

  accepts_nested_attributes_for :cart_pots

  def total
    order_pots.sum(&:total)
  end
end
