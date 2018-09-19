class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, format: /\A\S+@\S+\z/, uniqueness: {  case_sensitive: false }
  validates :password, presence: true

  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def total_orders_price_in_cart
    carts.sum(&:total_price) if carts.size != 0
  end

  def total_orders_price
    orders.sum(&:total) if orders.size != 0
  end

end
