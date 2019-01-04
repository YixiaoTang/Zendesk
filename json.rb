require 'json'
json = {'ticket' => {subject:  "My printer is on ok!",
                        description:  "OK." ,
                        priority: "urgent"}}



my_hash = JSON.parse(json)
puts my_hash