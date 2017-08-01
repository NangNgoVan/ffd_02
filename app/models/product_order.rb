class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def update_quant_price product, quant
    update_attributes unitprice: product.price, quantity: quant
  end
end
