class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.create(params[:picture].permit(:feeling, :image))
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
		@picture.update(params[:picture].permit(:feeling, :image))
		redirect_to pictures_path
		flash[:notice] = "Picture edited successfully"
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_path
		flash[:notice] = "Picture deleted successfully"
	end

end
