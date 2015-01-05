require 'rails_helper'

context 'editing posts' do

  before do
    sign_up
    create_post
  end

  scenario 'let a user edit a post' do
    visit '/posts'
    click_link 'Edit Smiley dog'
    fill_in 'Title', with: 'Adorable dog smiling'
    click_button 'Update Post'
    expect(page).to have_content 'Adorable dog smiling'
    expect(current_path).to eq '/posts'
  end
end
