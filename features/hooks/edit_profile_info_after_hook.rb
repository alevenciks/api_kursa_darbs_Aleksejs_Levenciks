After do |scenario|
  if scenario.failed? and scenario.name == "Edit profile information - positive"
    firstName = 'Aleksejs'
    lastName = 'Levenciks'
    puts "aa"
    edit_profile_information(@user, firstName, lastName)
  end
end