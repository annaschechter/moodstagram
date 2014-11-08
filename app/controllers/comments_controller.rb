class CommentsController < ApplicationController

before_action :authenticate_user!

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
		comment = @picture.comments.create(params[:comment].permit(:message))
		if comment.save
			redirect_to pictures_path
		else 
			redirect_to new_picture_comment_path(@picture)
			flash[:error] = "Your comment cannot be blank!"
		end
	end
end
