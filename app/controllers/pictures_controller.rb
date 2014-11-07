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

end
