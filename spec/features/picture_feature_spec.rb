require 'rails_helper'

describe 'pictures' do

	it 'should display an option to post a picture' do
		visit '/pictures'
		expect(page).to have_link 'Post picture'
	end

end