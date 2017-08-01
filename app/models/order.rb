class Order < ApplicationRecord
  has_many :productorders, class_name: ProductOrder.name
  has_many :products, through: :productorders
  has_one :payment

  def add_product product, quant
    products << product
    product_orders = productorders.find_by(product_id: product.id)

    unless product_orders
      flash[:info] = t "khongtimthay"
      redirect_to root_path
    end
    product_orders.update_quant_price product, quant
  end
end
