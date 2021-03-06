require 'rails_helper'
require 'helpers/helper'

describe 'comments' do 

	before do 
		user_sign_up
		create_picture
	end

	it 'users can leave a comment for a picture' do
		leave_comment_for_happy
		find('#happy').click
		expect(page).to have_content 'message'
	end

	it 'only signed in users can leave a comment for a picture' do
		click_link 'Sign out'
		click_link 'Comment'
		expect(page).not_to have_button 'Post comment'
		expect(page).to have_content 'Log in'
	end 

	it 'only allows to post non-empty comments' do
		click_link "Comment"
		fill_in 'Message', with: ' '
		click_button 'Post comment'
		expect(page).to have_content 'Your comment cannot be blank!'
	end

	it 'users can delete comments' do
		leave_comment_for_happy
		find('#happy').click
		click_link 'Delete comment'
		expect(page).to have_content 'Comment deleted successfully'
		find('#happy').click
		expect(page).not_to have_content 'message'
	end

	it 'users can only delete comments that they wrote' do
		leave_comment_for_happy
		click_link 'Sign out'
		user_sign_up("sam@test.com", 91234567)
		find('#happy').click
		expect(page).not_to have_selector'#delete-comment-message'
	end
	
end