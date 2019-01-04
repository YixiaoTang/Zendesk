require 'net/http'
require 'pp'
require 'json'
accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"
def getTicketList (subDomain,accessToken)
  uri = URI('https://'+subDomain+'.zendesk.com/api/v2/tickets.json')
  params = { :access_token => accessToken}
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

def printTicket(tickets)
  puts "ticket_num: #{tickets.count}"
  puts "---------------------------------------"
  for i in 1..tickets.count
    puts "ticket_index: #{i}"
    puts "subject: #{tickets[i-1]['subject']}"
    puts "description: #{tickets[i-1]['description']}"
    puts "---------------------------------------"
  end
end

def printDetailTicket(tickets)
  puts "Which ticket for more detail, input the ticket index(input Q to exit)"
  input = gets
  while input.chomp != "Q"
    num = input.to_i
    if num<=0 || num>tickets.count
      puts "Error, invalid input. Input must be Integer and in the index range: 1 - #{tickets.count}"
      puts "Which ticket for more detail, input Q to exit"
      input = gets
      next
    end
    pp tickets.at(num-1)
    puts "Which ticket for more detail, input Q to exit"
    input = gets
  end
end
tickets = getTicketList(subDomain,accessToken)
if tickets
  printTicket(tickets)
  printDetailTicket(tickets)
else
  puts "get tickets failed"
end
