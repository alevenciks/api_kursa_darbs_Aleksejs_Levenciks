Given(/^I have logged in as a regular user$/) do
  @user = User.new('aleksejs@siltumnica.com', 'password1')
  login_positve(@user)
end