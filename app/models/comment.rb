class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  validates :comment, presence: true
  validates :comment, length: { maximum: 300 }
end
