class AddPostIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :post, index: true
    add_foreign_key :reviews, :posts
  end
end
