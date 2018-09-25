class Flower < ApplicationRecord
  has_one_attached :flower_avatar
  
  # Paperclip
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :order_flowers, dependent: :destroy
  has_many :order_pots, through: :order_flowers

  has_many :cart_flowers, dependent: :destroy
  has_many :cart_pots, through: :cart_flower

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :color, format: { with: /[a-zA-Z]/ }
  validates :origin, format: { with: /[a-zA-Z]/ }
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

  COUNTRY_FILTER = [
    'Spain',
    'Italy',
    'France'
  ].freeze

  COLOR_FILTER = [
    'Red',
    'White',
    'Lila',
    'Rosa',
    'Violet',
    'Orange'
  ]

  scope :name_asc, -> { order(name: :asc) }
  scope :name_desc, -> { order(name: :desc) }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }
  scope :location, ->(country) { where(origin: country) }
  scope :color, ->(color) { where(color: color) }
end