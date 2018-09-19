class Flower < ApplicationRecord
  has_many :order_flowers, dependent: :destroy
  has_many :order_pots, through: :order_flowers

  has_many :cart_flowers, dependent: :destroy
  has_many :cart_pots, through: :cart_flower

  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :color, format: { with: /[a-zA-Z]/ }
  validates :origin, format: { with: /[a-zA-Z]/ }
  validates :image, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
end