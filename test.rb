a = "100"
puts a.to_i
my_hash = {:ticket => {}}
puts 'Input subject'
subject = gets
my_hash[:ticket]['subject'] =  subject
my_hash[:ticket]['description'] = "852"
my_hash[:ticket]['priority'] = 'normal'


ticket = {ticket:
              {
                  subject:  "My printer is on ok!",
                  description:  "OK." ,
                  priority: "urgent"
              }
}
puts my_hash