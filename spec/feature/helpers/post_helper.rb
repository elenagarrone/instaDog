def create_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Title', with: 'Smiley dog'
  # attach_file 'Image', File.join(Rails.root, 'spec', 'fixtures', 'cute-dog.jpg')
  click_on 'Create Post'
end
