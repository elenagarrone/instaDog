class LikesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @review.likes.create
    redirect_to posts_path
  end

end
