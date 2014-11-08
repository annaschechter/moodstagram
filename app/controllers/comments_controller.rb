class CommentsController < ApplicationController

	before_action :authenticate_user!

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
		@comment = @picture.comments.create(params[:comment].permit(:message))
		if @comment.save
			redirect_to pictures_path
		else 
			render 'new'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to pictures_path
		flash[:notice] = "Comment deleted successfully"
	end

end
