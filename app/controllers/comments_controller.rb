class CommentsController < ApplicationController
  attr_reader :comment

  def create
    @comment = comment = current_user.comments.build comment_params

    return unless comment.save
    respond_to do |format|
      format.html{redirect_to comment.product}
      format.js
    end
  end

  def destroy
    @comment = current_user.comments.find_by id: params[:id]
    comment.destroy
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :product_id, :content
  end
end
