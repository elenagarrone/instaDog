require 'rails_helper'
require_relative 'helpers/user_helper'

context 'editing posts' do

  before do
    sign_up_first_user
    create_post
  end

  context 'when logged in' do
    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit Smiley dog'
      fill_in 'Title', with: 'Adorable dog smiling'
      click_button 'Update Post'
      expect(page).to have_content 'Adorable dog smiling'
      expect(current_path).to eq '/posts'
    end
  end

  context 'when logged in as another user from the one creating the post' do
    scenario "don't let a user edit a post" do
      sign_out
      sign_up_second_user
      visit '/posts'
      expect(page).not_to have_link 'Edit Smiley dog'
    end
  end

end
