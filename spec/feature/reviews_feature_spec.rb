require 'rails_helper'
require_relative 'helpers/post_helper'

feature 'commenting' do

  before do
    sign_up_first_user
    create_post
  end

  scenario 'allows a user to leave a comment using a form' do
    visit '/posts'
    click_link 'Comment Smiley dog'
    fill_in 'Comment', with: 'so funny!'
    click_button 'Leave Comment'
    click_on 'Smiley dog'
    expect(page).to have_content 'so funny!'
  end

end
