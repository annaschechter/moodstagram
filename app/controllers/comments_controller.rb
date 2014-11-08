class CommentsController < ApplicationController

before_action :authenticate_user!

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
		comment = @picture.comments.create(params[:comment].permit(:message))
		redirect_to pictures_path
	end
end
