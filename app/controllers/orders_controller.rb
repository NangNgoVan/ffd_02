class OrdersController < ApplicationController
  attr_reader :order, :product

  def show; end

  def create
    order = current_user.orders.build
    return unless order.save
    @product = Product.find_by id: params[:product_id]
    check_product
    order.add_product product, params[:quant]["1"]
  end

  def destroy; end

  private

  def check_product
    return if product
    flash[:info] = t "khongtimthay"
    redirect_to root_path
  end
end
