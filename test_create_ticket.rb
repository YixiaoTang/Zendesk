require_relative 'create_ticket'
accessToken = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
subDomain = "z3nsqidexercise-yixiao"
obj1 = CreateTicket.new(subDomain, accessToken)

res = obj1.createTicket()
if res.is_a?(Net::HTTPSuccess)
  puts "Success ! Input D to show response, any other input to quit "
  input = gets
  if input.chomp == 'D'
    pp JSON.parse(res.body)
  end
else
  puts "Post failed "
end