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

  def print_ticket(tickets)
    puts "***  ticket_num: #{tickets.count}  ***"
    puts "---------------------------------------"
    for i in 1..tickets.count
      puts "ticket_index: #{i}"
      puts "subject: #{tickets[i - 1]['subject']}"
      puts "description: #{tickets[i - 1]['description']}"
      puts "status: #{tickets[i-1]['status']}"
      puts "---------------------------------------"
    end
  end

  def print_detail_ticket(tickets)
    puts "Which ticket for more detail, input the ticket index(input Q to quit)"
    input = gets
    while input.chomp != "Q"
      num = input.to_i
      if num <= 0 || num > tickets.count
        puts "Error, invalid input. Input must be Integer and in the index range: 1 - #{tickets.count}"
        puts "Which ticket for more detail, input Q to exit"
        input = gets
        next
      end
      pp tickets.at(num - 1)
      puts "Which ticket for more detail, input Q to exit"
      input = gets
    end
  end
end


