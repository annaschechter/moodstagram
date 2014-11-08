require 'rails_helper'
require 'helpers/helper'

describe 'comment' do 

	before do 
		create_picture
	end

	it 'users can leave a comment for a picture' do
		find('#comment-happy').click
		fill_in 'Message', with: 'message'
		click_button 'Post comment'
		expect(page).to have_content 'message'
	end 
	
end