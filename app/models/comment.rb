class Comment < ApplicationRecord
  belongs_to :flower

  validates :text, allow_blank: true, length: { maximum: 200 }
end
