class OrdersController < ApplicationController
  attr_reader :order, :product

  def show
    order = Order.find_by(id: params[:id])
    unless order
      flash[:info] = t "khongtimthay"
      redirect_to root_path
    end
    @products = order.productorders
    respond_to do |f|
      f.js{render layout: false}
    end
  end

  def create
    order = current_user.orders.build
    return unless order.save
    @product = Product.find_by id: params[:product_id]
    check_product
    order.add_product product, params[:quant]["1"]
    redirect_to orders_user_url current_user
  end

  def destroy; end

  private

  def check_product
    return if product
    flash[:info] = t "khongtimthay"
    redirect_to root_path
  end
end
