class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable

  has_many :payments
  has_many :comments, dependent: :destroy
  has_many :products
  has_many :orders
  has_many :ratings

  def author? comment
    self == comment.user
  end
end
