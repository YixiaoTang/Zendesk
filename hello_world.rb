require 'net/http'
require 'pp'
require 'json'
accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"
uri = URI('https://'+subDomain+'.zendesk.com/api/v2/tickets.json')
params = { :access_token => accessToken}
uri.query = URI.encode_www_form(params)
res = Net::HTTP.get_response(uri)
obj = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
puts obj.tickets.length
pp obj