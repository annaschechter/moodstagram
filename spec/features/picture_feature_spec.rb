require 'rails_helper'

describe 'pictures' do

	it 'should display an option to post a picture' do
		visit '/pictures'
		expect(page).to have_link 'Post picture'
	end

	it 'users can upload a photo' do
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: 'Happy'  
		click_button 'Create Picture'
		expect(Picture.all.count).to equal 1
	end

end