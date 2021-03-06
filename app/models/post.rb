class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "242x200>" }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :image, :attachment_presence => true

  has_many :reviews, dependent: :destroy
  validates :title, length: { minimum: 3 }
  belongs_to :user
  has_many :likes, dependent: :destroy

end
