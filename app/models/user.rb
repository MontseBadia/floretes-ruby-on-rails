class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, format: /\A\S+@\S+\z/, uniqueness: {  case_sensitive: false }
  validates :password, presence: true

  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  after_create :create_cart! #---

  scope :find_name, -> (term) { where('LOWER(name) like ?', "%#{term.downcase}%") }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def total_orders_price_in_cart
    cart.total_price
  end

  def total_orders_price
    orders.compact.sum(&:total)# if orders.size != 0
  end

  def create_cart
    cart = Cart.create
  end
end
