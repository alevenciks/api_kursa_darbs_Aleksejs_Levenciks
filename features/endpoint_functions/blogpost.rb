require 'rest-client'

def get_another_user_blogpost_id(user, authorId)
  response = API.get('http://195.13.194.180:8090/api/posts?=' + authorId.to_s,
                     headers: {'Authorization' => user.auth_token},
                     cookies: {})

  assert_status_code(200, response, "Get blogpost")
  response_hash = JSON.parse(response)
  return response_hash[0]['id']
end

def update_blogpost_negative(user, blogpostId)
  newContent = String.new(rand(36**20).to_s(36))
  newTitle = String.new(rand(36**10).to_s(36))

  payload = {
      'content' => newContent,
      'title' => newTitle
  }.to_json

  response = API.put('http://195.13.194.180:8090/api/post?post_id=' + blogpostId.to_s,
                     headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                     cookies: {},
                     payload: payload)

  assert_status_code(403, response, "Blogpost not updated")

  response_hash = JSON.parse(response)
  #check if correct error message returned
  assert_equal("You cannot delete a post that has not been created by you!",
               response_hash['message'], 'Error message is not correct')

  puts response_hash
end