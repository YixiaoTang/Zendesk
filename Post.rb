require 'net/http'
require 'uri'
require 'json'

accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"
uri = URI('https://'+subDomain+'.zendesk.com/api/v2/tickets.json')
params = { :access_token => accessToken}
uri.query = URI.encode_www_form(params)
header = {'Content-Type': 'application/json'}
ticket = {ticket:
    {
        subject:  "My printer is on ok!",
        description:  "OK." ,
        priority: "urgent"
    }
}

json = {'ticket' => {subject:  "My printer is on ok!",
                     description:  "OK." ,
                     priority: "urgent"}}
my_hash = {:ticket => {}}
#my_hash[:ticket]['subject'] =  "My house is fire!"
my_hash[:ticket]['description'] = "852"
#my_hash[:ticket]['priority'] = 'normal'

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = my_hash.to_json

# Send the request
response = http.request(request)
puts response.body