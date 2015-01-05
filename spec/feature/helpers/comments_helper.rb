def create_comment
  visit '/posts'
  click_link 'Comment Smiley dog'
  fill_in 'Comment', with: 'so funny!'
  select '5', from: 'Rating'
  click_button 'Leave Comment'
end
