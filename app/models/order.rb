class Order < ApplicationRecord
  belongs_to :user

  has_many :order_pots, dependent: :destroy, inverse_of: :order
  has_many :pots, through: :order_pots
  has_many :cart_pots, dependent: :destroy, inverse_of: :cart
  has_many :pots, through: :cart_pots

  accepts_nested_attributes_for :order_pots
  accepts_nested_attributes_for :cart_pots

  validates :total_price, numericality: {greater_than: 0}
  validates :phone, numericality: true, length: { minimum: 6, maximum: 10 }, format: {
    with: /\d[0-9]\)*\z/, 
    message: "allows only positive numbers without spaces"
  } 
  validates :address, presence: true #--> make a model out of this!

  def total
    order_pots.sum(&:total)
  end
end
