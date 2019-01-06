require_relative 'update_ticket'
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
sub_domain = "z3nsqidexercise-yixiao"
obj1 = UpdateTicket.new(sub_domain,access_token)
res = obj1.update_ticket(51)
#true if id:51 exist and input valid status
pp res.is_a?(Net::HTTPSuccess)