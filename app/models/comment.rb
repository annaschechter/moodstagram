class Comment < ActiveRecord::Base
	validates_presence_of :message
	belongs_to :picture
end
