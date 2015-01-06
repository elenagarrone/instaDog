require 'rails_helper'
require_relative 'helpers/user_helper'

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
      sign_up_first_user
      create_post
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Smiley dog'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'while signed in' do

    before do
      sign_up_first_user
    end

    context 'creating a post' do
      scenario 'prompts a user to fill out a form, the display the new post' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Title', with: 'Smiley dog'
        # attach_file 'Image', 'public/images/missing.png'
        fill_in 'Description', with: 'My little puppy'
        click_on 'Create Post'
        expect(page).to have_content 'Smiley dog'
        expect(page).to have_content 'My little puppy'
        # expect(page).to have_css("img[src*='public/images/missing.png']")
        expect(current_path).to eq '/posts'
      end

      context 'with an invalid post' do
        it 'does not let you submit a title that is too short' do
          visit '/posts'
          click_link 'Add a post'
          fill_in 'Title', with: 'aa'
          click_button 'Create Post'
          expect(page).not_to have_css 'h2', text: 'aa'
          expect(page).to have_content 'error'
        end
      end
    end

  end

  context 'viewing the posts' do
    let!(:smiley_dog) { Post.create(title: 'Smiley dog') }

    scenario 'lets a user view the post' do
      visit '/posts'
      click_link 'Smiley dog'
      expect(page).to have_content 'Smiley dog'
      expect(current_path).to eq "/posts/#{ smiley_dog.id }"
    end
  end

end
