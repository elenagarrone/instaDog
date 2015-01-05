def create_comment
  visit '/posts'
  click_link 'Comment Smiley dog'
  fill_in 'Comment', with: 'so funny!'
  click_button 'Leave Comment'
end
