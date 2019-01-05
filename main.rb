require_relative 'create_ticket'
require_relative 'get_tickets'
accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"

introduction = "Select method: \n<1> List tickets \n<2> Create new ticket \n<3> Exit "
puts introduction
while 1
  fun = gets
  fun = fun.to_i
  if fun == 1
  elsif fun == 2
  elsif fun == 3
  else
    puts "Invalid Input"
    puts introduction
    next
  end
end