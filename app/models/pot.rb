class Pot < ApplicationRecord
  has_many :order_pots, dependent: :destroy
  has_many :orders, through: :order_pots

  has_many :cart_pots, dependent: :destroy
  has_many :carts, through: :cart_pots

  validates :name, uniqueness: true
  validates :material, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :dimensions, format: {
    with: /\d/,
    message: "must include numerical values"
  }
  validates :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :image, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  def self.exists?(id)
    Pot.find_by(id: id)
  end

end