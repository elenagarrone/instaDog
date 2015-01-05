class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :rating, inclusion: (1..5)
end
