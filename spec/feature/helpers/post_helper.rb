def create_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Title', with: 'Smiley dog'
  # attach_file 'Image', 'public/:style/missing.png'
  click_on 'Create Post'
end
