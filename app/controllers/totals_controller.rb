class TotalsController < ApplicationController
  def index
    @user = user = User.find_by id: params[:id]

    if user
      @orders = user.orders.sort_by_created_at
        .paginate(:page => params[:page], per_page: 10)
    else
      flash[:info] = t "khongtimthay"
      redirect_to root_path
    end
  end
end
