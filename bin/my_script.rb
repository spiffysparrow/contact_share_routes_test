require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
#
# puts RestClient.get(url)

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/2'
# ).to_s
#
# # p "url #{url}"
#
# puts RestClient.patch(url, { user: { name: "Bizmo", email: "bizmo@gizmo.gizmo" }})

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares'
).to_s

puts RestClient.post(url,
                      { contact_share: { contact_id: 2, user_id:2 }})
  #
# def create_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { user: { name: "Gizmo", email: "bizmo@gizmo.gizmo" } }
#   )
# end
#
#
# begin
# create_user
# rescue RestClient::Exception => e
#   p e.message
# end
