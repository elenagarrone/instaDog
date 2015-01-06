require 'rails_helper'
require_relative 'helpers/comments_helper'
require_relative 'helpers/post_helper'
require_relative 'helpers/user_helper'

feature 'like reviews' do

  before do
    Post.create(title: 'Smiley dog')
  end

  xscenario 'a user can like a review, which updates the review like count', js: true do
    visit '/'
    click_on 'Like'
    expect(page).to have_content '1 Likes'
    click_on 'Like'
    expect(page).to have_content '2 Likes'
  end

  xscenario 'a user likes another post', js: true do
    Post.create(title: 'Cute dog')
    visit '/'
    click_link 'Like'
    expect(page).to have_content '1 Likes'
    expect(page).to have_content '0 Likes'
  end

  xscenario 'a user likes another post AND UPDATE THE PAGE', js: true do
    Post.create(title: 'Cute dog')
    visit '/'
    save_and_open_page
    find("a#cutedog").click_link("Like")
    visit '/'
    expect(page).to have_content '1 Likes'
    expect(page).to have_content '0 Likes'
  end

end
