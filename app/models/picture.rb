class Picture < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_presence_of :image, :message => ": You did not choose a valid file"
  has_many :comments
  has_many :likes
  validates :price, numericality: true
end
