require_relative 'create_ticket'
require_relative 'get_tickets'

sub_domain = "z3nsqidexercise-yixiao"
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
get_tickets = GetTickets.new(sub_domain, access_token)
create_ticket = CreateTicket.new(sub_domain, access_token)
introduction = "---------------------------------------------
Select method: \n<1> List tickets \n<2> Create new ticket \n<3> Exit "

while 1
  puts introduction
  fun = gets
  fun = fun.to_i
  if fun == 1
    tickets = get_tickets.get_ticket_list
    if tickets
      get_tickets.print_ticket(tickets)
      get_tickets.print_detail_ticket(tickets)
    else
      puts "get tickets failed"
    end
  elsif fun == 2
    res = create_ticket.create_ticket
    if res.is_a?(Net::HTTPSuccess)
      puts "Success ! Input D to show response, any other input to quit "
      input = gets
      if input.chomp == 'D'
        pp JSON.parse(res.body)
      end
    else
      puts "Post failed. Please check input and authorization information"
    end
  elsif fun == 3
    break
  else
    puts "Invalid Input"
    next
  end
end