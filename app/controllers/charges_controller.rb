class ChargesController < ApplicationController

	def new
		@pic = Picture.find(params[:picture_id])
	end

	def create
		@pic = Picture.find(params[:picture_id])
		@amount = (@pic.price * 100).to_i
		
		customer = Stripe::Customer.create(
			:email => User.find(current_user.id).email,
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => "Picture of #{@pic.feeling}",
			:currency => 'gbp',
		)

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_picture_charge_path(@pic)
	end
end
