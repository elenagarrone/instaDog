class Review < ActiveRecord::Base
  belongs_to :post
  validates :rating, inclusion: (1..5)
end
