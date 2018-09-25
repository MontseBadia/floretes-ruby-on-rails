class Comment < ApplicationRecord
  belongs_to :flower
  belongs_to :user

  validates :text, presence: true, length: { maximum: 200 }
  validates :user, presence: true
end
