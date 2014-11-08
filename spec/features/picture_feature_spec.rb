require 'rails_helper'
require 'helpers/helper'

describe 'pictures' do

	before do
		user_sign_up
		create_picture
	end

	it 'should display an option to post a picture' do
		visit '/pictures'
		expect(page).to have_link 'Post picture'
	end

	it 'can be uploaded' do
		expect(Picture.all.count).to equal 1
	end

	it 'uploaded pictures are displayed on the main page' do
		expect(page).to have_css 'img'
	end

	it 'can be deleted' do
		create_picture("sad")
		click_link 'Delete #happy'
		expect(page).not_to have_content 'happy'
		expect(page).to have_content 'Picture deleted successfully'
		expect(page).to have_content 'sad'
	end

	it 'can be edited' do
		click_link 'Edit #happy'
		fill_in 'Feeling', with: "not happy"
		click_button 'Update Picture'
		expect(page).to have_content 'Picture edited successfully'
		expect(page).to have_content 'not happy'
	end

	it 'every picture has its own page' do
		find('#happy').click
		expect(page).to have_css 'img'
		expect(page).to have_content 'happy'
	end

	it 'only signed in users can upload pictures' do
		click_link 'Sign out'
		click_link 'Post picture'
		expect(page).not_to have_button 'Create picture'
		expect(page).to have_content 'Log in'
	end

end