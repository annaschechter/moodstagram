class CommentsController < ApplicationController

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
		comment = @picture.comments.create(params[:comment].permit(:message))
		# comment.time_added = Time.now
		redirect_to pictures
	end
end
