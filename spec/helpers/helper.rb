	def create_picture(feeling="happy")
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: feeling  
		click_button 'Create Picture'
	end

	def user_sign_up(email="anna@test.com", password=12345678)
		visit '/'
		click_link 'Sign up'
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		fill_in 'Password confirmation', with: password
		click_button 'Sign up'
	end