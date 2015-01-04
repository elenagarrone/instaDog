class ReviewsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.reviews.create(review_params)
  end

  def review_params
    params.require(:review).permit(:comments, :rating)
  end

end
