def sign_up_first_user
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def sign_up_second_user
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test2@example.com'
  fill_in 'Password', with: 'testtes2'
  fill_in 'Password confirmation', with: 'testtes2'
  click_button 'Sign up'
end

def sign_out
  visit '/'
  click_on 'Sign out' 
end
