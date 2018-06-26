blogpostId = 0

And(/^I retrieve another User blogposts$/) do
  blogpostId = get_another_user_blogpost_id(@user, 1)
end

Then(/^I can edit another User blogpost$/) do
  update_blogpost_negative(@user, blogpostId)
end