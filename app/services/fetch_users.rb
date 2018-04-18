require 'uri'
require 'net/http'

url = URI("https://api.planningcenteronline.com/people/v2/people?where%5Bfirst_name%5D=Jason&where%5Blast_name%5D=Doggart")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["content-type"] = 'application/json'
request.basic_auth '47d6b0bd8d5f3ef8a1e1af2a1391ea31bda4a5a7477e853ede96ca4d1d1350d7', 'dbe522b02d435ad327a0ccb2d4410576da1899b45797284de55f331853ea5bc0'

response = http.request(request)
puts response.read_body
