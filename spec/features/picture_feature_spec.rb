require 'rails_helper'

describe 'pictures' do

	it 'should display an option to post a picture' do
		visit '/pictures'
		expect(page).to have_link 'Post picture'
	end

	it 'can be upload a picture' do
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: 'Happy'  
		click_button 'Create Picture'
		expect(Picture.all.count).to equal 1
	end

	it 'uploaded pictures are displayed on the main page' do
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: 'Happy'  
		click_button 'Create Picture'
		expect(page).to have_css 'img'
	end

	it 'can be deleted' do
		visit '/pictures'
		click_link 'Post picture'
		attach_file('Image', Rails.root + "spec/fixtures/images/bird.jpg")
		fill_in 'Feeling', with: 'Happy'  
		click_button 'Create Picture'
		click_link 'Delete picture'
		expect(page).not_to have_css 'img'
		expect(page).to have_content 'Picture deleted successfully'
	end

end