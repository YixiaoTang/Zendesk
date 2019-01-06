Zendesk coding challenge
----
This project based on Zendesk API to implement two basic functions: list all tickets in one specific account and create new ticket.  
After listing all tickets, user can delete or update one of them.
## files
**main.rb** Main file, use ListTickets and CreateTicket.  
**get_tickets.rb** GetTickets class, which has three methods to do Get request and show tickets.  
**create_ticket.rb** Include CreateTicket class.  
**delete_ticket.rb** Include DeleteTicket class to delete one ticket by id.  
**update_ticket.rb** Include UpdateTicket class to update status of one ticket by id.  
**list_ticket** Combine GetTickets, DeleteTicket and UpdateTicket as sub function.  
**test_files** are test files for classes.  
## How to run
1. Set the sub_domain and access_token in main file. Application will use default valuable if no new authorization.
2. Select function, list tickets or create a new one.
3. For list tickets, select print detail inf for one ticket, delete, or update status.
4. Check authorization when verification fail.

## Input format
1. After listing tickets, user can select one ticket, it must be integer from 1 to count of tickets. 
2. Empty description if creation will induce post fail.
## Unexpected input
### If the sub_domain and access_token is wrong, request will fail.
### Two Screenshots show invalid input in application
![](https://github.com/YixiaoTang/Zendesk/blob/master/Unexpected%20input.png)
![](https://github.com/YixiaoTang/Zendesk/blob/master/Empty%20description.png)
