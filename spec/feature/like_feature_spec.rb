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
    click_on 'Like'
    expect(page).to have_content '1 Likes'
    click_on 'Like'
    expect(page).to have_content '2 Likes'
  end

end
