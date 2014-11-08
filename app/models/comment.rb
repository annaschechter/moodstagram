class Comment < ActiveRecord::Base
	validates_presence_of :message, :message => " :Your comment cannot be blank!"
	belongs_to :picture
	belongs_to :user
end
