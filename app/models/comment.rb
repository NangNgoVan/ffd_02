class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :email, to: :user, prefix: true

  validates :content, presence: true,
    length: {maximum: Settings.comment.max_length}
end
