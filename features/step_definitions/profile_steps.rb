And(/^I can access my profile information$/) do
  check_profile_info(@user)
end

Then(/^I can edit my profile information$/) do
  firstName = String.new(rand(36**10).to_s(36))
  lastName = String.new(rand(36**10).to_s(36))
  edit_profile_information(@user, firstName, lastName)
end

Then(/^I can set profile information to default$/) do
  firstName = 'Aleksejs'
  lastName = 'Levenciks'
  edit_profile_information(@user, firstName, lastName)
end