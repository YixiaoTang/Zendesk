require 'net/http'
require 'pp'
require 'json'
class DeleteTicket
  def initialize(subDomain, accessToken)
    @access_token = accessToken
    @sub_domain = subDomain
  end

  def delete_ticket(id)
    uri = URI('https://' + @sub_domain + '.zendesk.com/api/v2/tickets/destroy_many.json')
    params = {:access_token => @access_token,:ids => id}
    uri.query = URI.encode_www_form(params)
    header = {'Content-Type': 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Delete.new(uri.request_uri, header)
    response = http.request(request)
    return response
  end
end

