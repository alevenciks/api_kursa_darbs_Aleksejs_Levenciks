require 'rest-client'

def check_profile_info(user)

  response = API.get('http://195.13.194.180:8090/api/profile',
                     headers: {'Authorization' => user.auth_token },
                     cookies: {})
  assert_status_code(200, response, "Check profile info")

  response_hash = JSON.parse(response)

  #Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Ids dont match!')
  #Check if email is correct
  assert_equal(user.email, response_hash['email'], 'Email is not correct!')
  #Check if firstName is correct
  assert_equal(user.firstName, response_hash['firstName'], 'firstName is not correct!')
  #Check if lastName is correct
  assert_equal(user.lastName, response_hash['lastName'], 'lastName is not correct!')
end

def edit_profile_information(user, firstName, lastName)
  payload = {
      'firstName' => firstName,
      'lastName' => lastName
  }.to_json

  response = API.put('http://195.13.194.180:8090/api/profile',
                      headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                      cookies: {},
                      payload: payload)

  response_hash = JSON.parse(response)

  #Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Ids dont match!')
  #Check if email is correct
  assert_equal(user.email, response_hash['email'], 'Email is not correct!')
  #Check if firstName updated
  assert_equal(firstName, response_hash['firstName'], 'firstName is not updated!')
  #Check if lastName updated
  assert_equal(lastName, response_hash['lastName'], 'firstName is not updated!')

  user.firstName = response_hash['firstName']
  user.lastName = response_hash['lastName']
end