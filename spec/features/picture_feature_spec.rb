require 'rails_helper'

describe 'pictures' do

	def create_picture(feeling="happy")
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: feeling  
		click_button 'Create Picture'
	end

	before do
		create_picture
	end

	it 'should display an option to post a picture' do
		visit '/pictures'
		expect(page).to have_link 'Post picture'
	end

	it 'can be upload a picture' do
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

end