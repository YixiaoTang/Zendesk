Zendesk coding challenge
----
This project based on Zendesk API to implement two basic functions: list all tickets in one specific account and create new ticket
## files
**main.rb** Main file.  
**get_tickets.rb** Include GetTickets class include three methods to do Get request and show tickets.  
**create_ticket.rb** Include CreateTicket  
**test_get_tickets.rb** and **test_create_ticket** are test files for two class  
## How to run
1. Set the sub_domain and access_token in main file.  
2. Select '1', '2' or '3' for the method
3. When list tickets, application will list brief version of all tickets, and user can select one to show more, input 'q' to quit
4. When create ticket, user should input subject, description and priority. Only description can not be empty. If succeed, application can show the response from API.
## Input format
1. When list tickets, user can select one ticket, it must be integer from 1 to count of tickets. 
2. Empty description will induce post fail.
## Unexpected input
If the sub_domain and access_token is wrong, request will fail.
![](https://github.com/YixiaoTang/Zendesk/blob/master/Unexpected%20input.png)
![](https://github.com/YixiaoTang/Zendesk/blob/master/Empty%20description.png)
