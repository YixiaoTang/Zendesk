require_relative 'get_tickets'
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
sub_domain = "z3nsqidexercise-yixiao"
obj1 = GetTickets.new(sub_domain,access_token)

tickets = obj1.get_ticket_list
if tickets
  # it should succeed
  puts"Success"
else
  puts "get tickets failed"
end

sub_domain = "z3nsqidexercise"#wrong subDomain
obj2 = GetTickets.new(sub_domain,access_token)
tickets = obj2.get_ticket_list
if tickets
else
  # It should fail
  puts "get tickets failed"
end

access_token = "Ae8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"#wrong token
sub_domain = "z3nsqidexercise-yixiao"
obj3 = GetTickets.new(sub_domain,access_token)
tickets = obj3.get_ticket_list
if tickets
else
  # It should fail
  puts "get tickets failed"
end