class Order < ApplicationRecord
  belongs_to :user

  has_many :order_pots, dependent: :destroy
  has_many :pots, through: :order_pots
end
