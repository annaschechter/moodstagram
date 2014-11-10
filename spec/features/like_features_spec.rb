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
		expect(page).to have_content 'Likes: 1'
		click_link 'Like'
		expect(page).to have_content 'Likes: 1'
	end
	
end