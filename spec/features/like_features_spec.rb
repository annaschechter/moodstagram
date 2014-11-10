require 'rails_helper'
require 'helpers/helper'

describe 'likes' do 
	
	it 'users can like pictures' do
		user_sign_up
		create_picture
		click_link 'Like'
		expect(page).to have_content 'Likes: 1'
	end
	
end