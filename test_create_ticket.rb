require_relative 'create_ticket'
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
sub_domain = "z3nsqidexercise-yixiao"
obj1 = CreateTicket.new(sub_domain, access_token)

res = obj1.create_ticket
if res.is_a?(Net::HTTPSuccess)
  #success when description is not empty
  puts "Success ! Input D to show response, any other input to quit "
  input = gets
  if input.chomp == 'D'
    pp JSON.parse(res.body)
  end
else
  puts "Post failed "
end

sub_domain = "z3nsqidexercise" #Wrong
obj2 = CreateTicket.new(sub_domain, access_token)
res = obj2.create_ticket
if res.is_a?(Net::HTTPSuccess)
else
  #it should fail
  puts "Post failed "
end