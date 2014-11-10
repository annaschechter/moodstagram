	def create_picture(feeling="happy")
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: feeling  
		fill_in 'Price', with: 5
		click_button 'Create Picture'
		@picture_id = (Picture.last).id
	end

	def user_sign_up(email="anna@test.com", password=12345678)
		visit '/'
		click_link 'Sign up'
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		fill_in 'Password confirmation', with: password
		click_button 'Sign up'
	end

	
	def leave_comment_for_happy
		click_link 'Comment'
		fill_in 'Message', with: 'message'
		click_button 'Post comment'
	end