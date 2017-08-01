class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = product = Product.find_by id: params[:id]

    return if product
    flash[:info] = t "khongtimthay"
    redirect_to root_path
  end
end
