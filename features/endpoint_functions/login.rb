require 'rest-client'

def login_positve(user)
  payload = {
      'email' => user.email,
      'password' => user.password
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/login',
                                 headers: {'Content-Type' => 'application/json'},
                                 cookies: {},
                                 payload: payload)

  # Check if 200OK is received
  assert_status_code(200, response, "Login")

  response_hash = JSON.parse(response)

  #Check if correct User is returned
  assert_equal(user.email, response_hash['email'], 'Logged User is not correct')

  user.firstName = response_hash['firstName']
  user.lastName = response_hash['lastName']
  user.id = response_hash['id']
  user.auth_token = response.headers[:authorization]
end