require 'rails_helper'
require_relative 'helpers/user_helper'
require_relative 'helpers/post_helper'
require_relative 'helpers/comments_helper'


context 'deleting comments' do

  before do
    sign_up_first_user
    create_post
    create_comment
  end

  scenario "is only possible when it's your own message" do
    visit '/posts'
    click_link 'Smiley dog'
    expect(page).to have_content 'so funny!'
    expect(page).to have_link 'Delete comment'
  end

  scenario "is not possible when it's not your own message" do
    sign_out
    sign_up_second_user
    visit '/posts'
    click_link 'Smiley dog'
    expect(page).to have_content 'so funny!'
    expect(page).not_to have_link 'Delete comment'
  end

end
