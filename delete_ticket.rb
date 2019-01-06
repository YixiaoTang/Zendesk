require 'net/http'
require 'pp'
require 'json'
class DeleteTicket
    def initialize(sub_domain, access_token)
      @access_token = access_token
      @sub_domain = sub_domain
    end

  def delete_ticket(id)
    uri = URI('https://' + @sub_domain + ".zendesk.com/api/v2/tickets/#{id}.json")
    params = {:access_token => @access_token}
    uri.query = URI.encode_www_form(params)
    header = {'Content-Type': 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Delete.new(uri.request_uri, header)
    response = http.request(request)
    return response
  end
end

