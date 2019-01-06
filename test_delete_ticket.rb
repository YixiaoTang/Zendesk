require_relative 'delete_Ticket'
access_token = "e8b899551f89ad07727cf5259cf4e92a1eabf5f291e3c61f6dc91011965536bf"
sub_domain = "z3nsqidexercise-yixiao"
obj1 = DeleteTicket.new(sub_domain,access_token)
res = obj1.delete_ticket(52)
#true if id:52 exist and delete successfully
pp res.is_a?(Net::HTTPSuccess)
