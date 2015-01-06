require 'rails_helper'
require_relative 'helpers/comments_helper'
require_relative 'helpers/post_helper'
require_relative 'helpers/user_helper'

feature 'like reviews' do

  before do
    Post.create(title: 'Smiley dog')
  end

  scenario 'a user can like a review, which updates the review like count', js: true do
    visit '/'
    click_link 'Like Smiley dog'
    expect(page).to have_content '1 Likes'
    click_link 'Like Smiley dog'
    expect(page).to have_content '2 Likes'
  end

  xscenario 'a user likes another post', js: true do
    Post.create(title: 'Cute dog')
    visit '/'
    click_link 'Like Cute dog'
    expect(page).to have_content '1 Likes'
    expect(page).to have_content '0 Likes'
  end

  scenario 'a user likes another post AND UPDATE THE PAGE', js: true do
    Post.create(title: 'Cute dog')
    visit '/'
    click_link 'Like Cute dog'
    visit '/'
    expect(page).to have_content '1 Likes'
    expect(page).to have_content '0 Likes'
  end

end
