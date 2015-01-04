require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'Smiley dog')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Smiley dog'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'creating a post' do
    scenario 'prompts a user to fill out a form, the display the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Smiley dog'
      # attach_file 'Image', 'public/:style/missing.png'
      click_on 'Create Post'
      expect(page).to have_content 'Smiley dog'
      # expect(page).to have_css("img[src*='public/:style/missing.png']")
      expect(current_path).to eq '/posts'
    end
  end

end
