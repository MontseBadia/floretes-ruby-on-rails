class Pot < ApplicationRecord
  has_many :order_pots, dependent: :destroy
  has_many :orders, through: :order_pots
end
