require 'rails_helper'
require_relative 'helpers/user_helper'
require_relative 'helpers/post_helper'
require_relative 'helpers/comments_helper'


context 'deleting posts' do

  before do
    sign_up_first_user
    create_post
  end

  context 'as the owner of the post' do
    scenario 'removes a posts when clicks on the delete link' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Smiley dog'
      expect(page).to have_content 'Post removed successfully'
    end

    scenario "removes the comments when clicking on the 'delete post' link" do
      create_comment
      visit '/posts'
      click_link 'Smiley dog'
      expect(page).to have_content 'so funny!'
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Smiley dog'
      expect(page).not_to have_content 'so funny!'
    end
  end

  context 'as another user' do
    scenario "cannot see the 'delete post' link" do
      sign_out
      sign_up_second_user
      visit '/posts'
      expect(page).not_to have_link 'Delete Smiley dog'
    end
  end

end
