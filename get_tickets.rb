require 'net/http'
require 'pp'
require 'json'
class GetTickets
  def initialize(subDomain,accessToken)
  @access_token = accessToken
  @sub_domain = subDomain
  end
  def get_ticket_list
    uri = URI('https://' + @sub_domain + '.zendesk.com/api/v2/tickets.json')
    params = {:access_token => @access_token}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      obj = JSON.parse(res.body)
      tickets = obj['tickets']
      return tickets
    else
      return nil
    end
  end
end


