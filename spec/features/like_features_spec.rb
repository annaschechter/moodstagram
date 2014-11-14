require 'rails_helper'
require 'helpers/helper'

describe 'likes' do 

	before do
		user_sign_up
		create_picture
	end
	
	it 'users can like pictures' do
		click_link 'Like'
		expect(page).to have_content 'Likes: 1'
	end

	it 'users can only like a picture once' do
		click_link 'Like'
		expect(page).to have_link 'Unlike'
		expect(page).not_to have_link 'Like'
	end

	it 'users can unlike picture' do
		click_link 'Like'
		click_link 'Unlike'
		expect(page).to have_content 'Likes: 0'
	end

end