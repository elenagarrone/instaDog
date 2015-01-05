class ReviewsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def review_params
    params.require(:review).permit(:comments)
  end

end
