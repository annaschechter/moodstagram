class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		@picture = Picture.find(params[:picture_id])
		@picture.likes.create(user_id: current_user.id)
		redirect_to pictures_path
	end

	def destroy
		@picture = Picture.find(params[:picture_id])
		@like = Like.find_by_picture_id_and_user_id(@picture.id, current_user.id)
		if @like
			@like.destroy
			redirect_to pictures_path
		else 
			redirect_to pictures_path
			flash[:error] = "You can only unlike pictures if you've liked it"
		end
	end

end
