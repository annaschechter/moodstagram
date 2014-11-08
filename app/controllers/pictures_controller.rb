class PicturesController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
			@picture = Picture.create(params[:picture].permit(:feeling, :image))
			@picture.user_id = current_user.id
			if @picture.save
				redirect_to pictures_path
			else 
				render 'new'
			end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.user_id == current_user.id
			@picture.update(params[:picture].permit(:feeling, :image))
			redirect_to pictures_path
			flash[:notice] = "Picture edited successfully"
		else
			redirect_to pictures_path
			flash[:notice] = "You are not the author of this post"
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		if @picture.user_id == current_user.id
			@picture.destroy
			redirect_to pictures_path
			flash[:notice] = "Picture deleted successfully"
		else
			redirect_to pictures_path
			flash[:notice] = "You are not the author of this post"
		end
	end

end
