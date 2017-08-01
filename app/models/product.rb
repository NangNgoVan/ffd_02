class Product < ApplicationRecord
  has_many :productorders, class_name: ProductOrder.name
  has_many :orders, through: :productorders
  has_many :productcategories, class_name: ProductCategory.name
  has_many :categories, through: :productcategories
  has_many :comments

  def comment_counter
    comments.count
  end
end
