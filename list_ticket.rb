require_relative 'get_tickets'
require_relative 'delete_ticket'
require_relative 'update_ticket'

class ListTickets
  @@list_ticket_introduction = "---------------------------------------------
Select next step:\n P Print detail information of specific ticket \n D Delete specific ticket \n U Update status of specific ticket \n Q quit
---------------------------------------------"
  def initialize(sub_domain, access_token)
    @access_token = access_token
    @sub_domain = sub_domain
  end

  def list_ticket
    get_tickets = GetTickets.new(@sub_domain, @access_token)
    tickets = get_tickets.get_ticket_list
    if tickets
      print_ticket(tickets)
      while 1
        puts @@list_ticket_introduction
        fun = gets
        fun = fun.chomp
        if fun == 'P'
          print_detail_ticket(tickets)
        elsif fun == 'D'
          delete_one_ticket(tickets)
          break
        elsif fun == 'U'
          update_one_ticket(tickets)
          break
        elsif fun == 'Q'
          break
        else
          puts "Invalid input"
        end
      end
    else
      puts "Get tickets failed, please check authorization information"
    end
  end

  def print_ticket(tickets)
    puts "***  ticket_num: #{tickets.count}  ***"
    puts "---------------------------------------"
    for i in 1..tickets.count
      puts "ticket_index: #{i}"
      puts "subject: #{tickets[i - 1]['subject']}"
      puts "description: #{tickets[i - 1]['description']}"
      puts "status: #{tickets[i-1]['status']}"
      puts "---------------------------------------"
    end
  end

  def print_detail_ticket(tickets)
    puts "Which ticket for more detail, input the ticket index 1 - #{tickets.count}(input Q to quit)"
    input = gets
    while input.chomp != "Q"
      num = input.to_i
      if num <= 0 || num > tickets.count
        puts "Error, invalid input. Input must be Integer and in the index range: 1 - #{tickets.count}"
        puts "Which ticket for more detail, input Q to exit"
        input = gets
        next
      end
      pp tickets.at(num - 1)
      puts "Which ticket for more detail, input the ticket index 1 - #{tickets.count}(input Q to quit)"
      input = gets
    end
  end

  def delete_one_ticket(tickets)
    delete_ticket = DeleteTicket.new(@sub_domain,@access_token)
    puts "Which ticket to delete, input the ticket index 1 - #{tickets.count}(input Q to quit)"
    input = gets
    while input.chomp != "Q"
      num = input.to_i
      if num <= 0 || num > tickets.count
        puts "Error, invalid input. Input must be Integer and in the index range: 1 - #{tickets.count} \nPlease re-enter the index (input Q to quit)"
        input = gets
      else
        res = delete_ticket.delete_ticket(tickets.at(num-1)['id'].to_i)
        if res.is_a?(Net::HTTPSuccess)
          puts "Delete success"
        else
          puts "Delete fail"
        end
        break
      end
    end
  end

  def update_one_ticket(tickets)
    update_ticket = UpdateTicket.new(@sub_domain,@access_token)
    puts "Which ticket to update, input the ticket index 1 - #{tickets.count}(input Q to quit)"
    input = gets
    while input.chomp != "Q"
      num = input.to_i
      if num <= 0 || num > tickets.count
        puts "Error, invalid input. Input must be Integer and in the index range: 1 - #{tickets.count} \nPlease re-enter the index (input Q to quit)"
      else
        puts "Current status is #{tickets.at(num-1)['status']}"
        res = update_ticket.update_ticket(tickets.at(num-1)['id'].to_i)
        if res.is_a?(Net::HTTPSuccess)
          puts "Update success"
          break
        else
          puts "Update fail, please check input format. re-enter index or quit"
        end
      end
      input = gets
    end
  end
end

