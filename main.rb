require_relative 'create_ticket'
require_relative 'list_ticket'

sub_domain = "z3nsqidexercise-yixiao"
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
main_introduction = "---------------------------------------------
Select method:\n<1> Set subdomain and access token \n<2> List tickets \n<3> Create new ticket \n<4> Show subdomain and access token \n<5> Exit
---------------------------------------------"


while 1
  puts main_introduction
  fun = gets
  fun = fun.to_i
  if fun == 1
    puts "Input subdomain"
    sub_domain = gets.chomp
    puts "Input access_token"
    access_token = gets.chomp
  elsif fun == 2
    list_ticket = ListTickets.new(sub_domain,access_token)
    list_ticket.list_ticket
  elsif fun == 3
    create_ticket = CreateTicket.new(sub_domain, access_token)
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
  elsif fun == 4
    puts "Subdomain: #{sub_domain}"
    puts "Access token: #{access_token}"
  elsif fun == 5
    break
  else
    puts "Invalid Input"
    next
  end
end
