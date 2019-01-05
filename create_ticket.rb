require 'net/http'
require 'uri'
require 'json'


class CreateTicket
  def initialize(subDomain,accessToken)
    @accessToken = accessToken
    @subDomain = subDomain
  end
  def createTicket()
    my_hash = {:ticket => {}}
    puts "Input subject of ticket"
    subject = gets
    my_hash[:ticket]['subject'] = subject.chomp
    puts "Input description of ticket, it can not be empty"
    description = gets
    my_hash[:ticket]['description'] = description.chomp
    puts "Input priority of ticket, Possible values: urgent, high, normal, low"
    priority = gets
    my_hash[:ticket]['priority'] = priority.chomp

    uri = URI('https://' + @subDomain + '.zendesk.com/api/v2/tickets.json')
    params = {:access_token => @accessToken}
    uri.query = URI.encode_www_form(params)
    header = {'Content-Type': 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = my_hash.to_json
    response = http.request(request)
    return response
  end
end
