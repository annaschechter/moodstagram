	def create_picture(feeling="happy")
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: feeling  
		click_button 'Create Picture'
	end