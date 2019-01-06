require 'net/http'
require 'uri'
require 'json'

class UpdateTicket
  def initialize(sub_domain,access_token)
    @access_token = access_token
    @sub_domain = sub_domain
  end

  def update_ticket(id)
    ticket = {:ticket => {}}
    puts "Input new status, Possible values: \"new\", \"open\", \"pending\", \"hold\", \"solved\", \"closed\" "
    subject = gets
    ticket[:ticket]['status'] = subject.chomp
    uri = URI('https://' + @sub_domain + ".zendesk.com/api/v2/tickets/#{id}.json")
    params = {:access_token => @access_token}
    uri.query = URI.encode_www_form(params)
    header = {'Content-Type': 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Put.new(uri.request_uri, header)
    request.body = ticket.to_json
    response = http.request(request)
    return response
  end
end