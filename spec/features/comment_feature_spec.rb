require 'rails_helper'
require 'helpers/helper'

describe 'comment' do 

	before do 
		user_sign_up
		create_picture
	end

	it 'users can leave a comment for a picture' do
		find('#comment-happy').click
		fill_in 'Message', with: 'message'
		click_button 'Post comment'
		expect(page).to have_content 'message'
	end

	it 'only signed in users can leave a comment for a picture' do
		click_link 'Sign out'
		find('#comment-happy').click
		expect(page).not_to have_button 'Post comment'
		expect(page).to have_content 'Log in'
	end 

	it 'only allows to post non-empty comments' do
		find('#comment-happy').click
		# fill_in 'Message', with: ' '
		click_button 'Post comment'
		expect(page).to have_content 'Your comment cannot be blank!'
	end
	
end