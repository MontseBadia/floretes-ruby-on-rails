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
  validates :image, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  SORT_FILTER = [
    ['Name ascending', 'name_asc'],
    ['Name descending', 'name_desc'],
    ['Price ascending', 'price_asc'],
    ['Price descending', 'price_desc']
  ].freeze

  scope :name_asc, -> { order(name: :asc) }
  scope :name_desc, -> { order(name: :desc) }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }

  def self.exists?(id)
    Pot.find_by(id: id)
  end

end