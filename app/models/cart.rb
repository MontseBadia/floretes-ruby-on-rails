class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_pots, dependent: :destroy, inverse_of: :cart
  has_many :pots, through: :cart_pots

  accepts_nested_attributes_for :cart_pots
end
