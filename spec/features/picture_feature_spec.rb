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


	describe 'creating pictures' do

		it 'can be uploaded' do
			expect(Picture.all.count).to equal 1
		end		

		it 'only signed in users can upload pictures' do
			click_link 'Sign out'
			click_link 'Post picture'
			expect(page).not_to have_button 'Create picture'
			expect(page).to have_content 'Log in'
		end

		it 'only allows to create pictures with images that are not empty' do
			click_link 'Post picture'
			fill_in 'Feeling', with: "feeling"  
			click_button 'Create Picture'
			expect(page).not_to have_css 'img'
			expect(page).to have_content "You did not choose a valid file"
		end

	end

	it 'uploaded pictures are displayed on the main page' do
		expect(page).to have_css 'img'
	end

	it 'every picture has its own page' do
		find('#happy').click
		expect(page).to have_css 'img'
		expect(page).to have_content 'happy'
	end

	describe 'deleting pictures' do

		it 'can be deleted' do
			visit '/pictures'
			click_link 'Delete'
			expect(page).not_to have_content 'happy'
			expect(page).to have_content 'Picture deleted successfully'
		end

		it 'only the author of the picture can see the link to delete the picture' do
			click_link 'Sign out'
			user_sign_up("sam@test.com", 91234567)
			visit '/pictures'
			expect(page).not_to have_link 'Delete'
		end

	end

	describe 'editing pictures' do

		it 'can be edited' do
			click_link 'Edit'
			fill_in 'Feeling', with: "not happy"
			click_button 'Update Picture'
			expect(page).to have_content 'Picture edited successfully'
			expect(page).to have_content 'not happy'
		end

		it 'only the author of the picture can see the link to edit the piscture' do
			click_link 'Sign out'
			user_sign_up("sam@test.com", 91234567)
			visit '/pictures'
			expect(page).not_to have_link 'Edit'
		end
		
	end

	describe 'buying picture' do

		it 'every picture has a price' do
			expect(page).to have_content 'Price: £5.00'
		end

		it "can see the form after pressing 'buy now'" do
			find('#happy').click
			click_link 'Buy now'
			expect(page).to have_css('form')
		end

		xit 'can be bought', js: true do
			find('#happy').click
			click_link('Buy now')
			find('.stripe-button-el').click
			stripe_iframe = all('iframe[name=stripe_checkout_app]').last
			Capybara.within_frame stripe_iframe do
				find('#email').set 'test@test.com'
				find('#card_number').set '4242 4242 4242 4242'
				find('#cc-exp').set 1216
				find('#cc-csc').set 123
				find('.iconTick').click
			end
			expect(page).to have_content 'Thank you, your order is complete!'
		end
	end


end