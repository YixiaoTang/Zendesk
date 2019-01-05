require_relative 'get_tickets'
accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"
obj1 = GetTickets.new(subDomain,accessToken)

tickets = obj1.getTicketList()
if tickets
  obj1.printTicket(tickets)
  obj1.printDetailTicket(tickets)
else
  puts "get tickets failed"
end

accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise"
obj2 = GetTickets.new(subDomain,accessToken)

tickets = obj2.getTicketList()
if tickets
  obj2.printTicket(tickets)
  obj2.printDetailTicket(tickets)
else
  puts "get tickets failed"
end