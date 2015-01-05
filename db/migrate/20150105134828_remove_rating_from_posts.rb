class RemoveRatingFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rating, :integer
  end
end
