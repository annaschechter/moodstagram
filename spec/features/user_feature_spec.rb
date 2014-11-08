require 'rails_helper'
require 'helpers/helper'

describe 'user' do 

	it 'users not signed in should see sign-n and sign-up links on the page' do
		visit '/'
		expect(page).to have_link 'Sign in'
		expect(page).to have_link 'Sign up'
	end

	it 'users signed in should see sign-out links on the page' do
		user_sign_up
		expect(page).not_to have_link 'Sign in'
		expect(page).to have_link 'Sign out'
	end
	
end