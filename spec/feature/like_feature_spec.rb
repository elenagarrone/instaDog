require 'rails_helper'
require_relative 'helpers/comments_helper'
require_relative 'helpers/post_helper'
require_relative 'helpers/user_helper'

feature 'like reviews' do

  before do
    sign_up_first_user
    create_post
    create_comment
  end

  scenario 'a user can like a review, which updates the review like count' do
    visit '/posts'
    click_link 'Like Smiley dog'
    expect(page).to have_content('1 Like')
  end

end
