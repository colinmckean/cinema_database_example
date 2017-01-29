require 'pry-byebug'
require_relative './models/Film'
require_relative './models/Ticket'
require_relative './models/Customer'
require_relative './models/TicketHolder'
#examples are comments at bottom, use lc_monetary="en_GB" in psql to set currancy to £;

customers_array = [
  customer_1 = Customer.new({
    'customer_name' => 'ARLENE',
    'funds' => rand(20..50)}),
  customer_2 = Customer.new({
    'customer_name' => 'ALASTAIR',
    'funds' => rand(20..50)}),
  customer_3 = Customer.new({
    'customer_name' => 'CHRIS',
    'funds' => rand(20..50)}),
  customer_4 = Customer.new({
    'customer_name' => 'DANIEL',
    'funds' => rand(20..50)}),
  customer_5 = Customer.new({
    'customer_name' => 'ELLEN',
    'funds' => rand(20..50)}),
  customer_6 = Customer.new({
    'customer_name' => 'GORDON',
    'funds' => rand(20..50)}),
  customer_7 = Customer.new({
    'customer_name' => 'JODIE',
    'funds' => rand(20..50)}),
  customer_8 = Customer.new({
    'customer_name' => 'JOHN',
    'funds' => rand(20..50)}),
  customer_9 = Customer.new({
    'customer_name' => 'KEIR',
    'funds' => rand(20..50)}),
  customer_10 = Customer.new({
    'customer_name' => 'MICHAELA',
    'funds' => rand(20..50)}),
  customer_11 = Customer.new({
    'customer_name' => 'MURRAY',
    'funds' => rand(20..50)}),
  customer_12 = Customer.new({
    'customer_name' => 'RUTH',
    'funds' => rand(20..50)}),
  customer_13 = Customer.new({
    'customer_name' => 'RYAN',
    'funds' => rand(20..50)}),
  customer_14 = Customer.new({
    'customer_name' => 'OTHER JOHN',
    'funds' => rand(20..50)}),
  customer_15 = Customer.new({
    'customer_name' => 'ALAN',
    'funds' => rand(20..50)}),
  customer_16 = Customer.new({
    'customer_name' => 'ALLY',
    'funds' => rand(20..50)}),
  customer_17 = Customer.new({
    'customer_name' => 'STEVE',
    'funds' => rand(20..50)}),
  customer_18 = Customer.new({
    'customer_name' => 'HARVEY',
    'funds' => rand(20..50)}),
  customer_19 = Customer.new({
    'customer_name' => 'LEIGH-ANN',
    'funds' => rand(20..50)}),
  customer_20 = Customer.new({
    'customer_name' => 'ADAM',
    'funds' => rand(20..50)}),
  customer_21 = Customer.new({
    'customer_name' => 'COLIN',
    'funds' => 100})
]


films_array = [
  film_1 = Film.new({
    'title' => 'The Godfather',
    'price'=>19.72}),
  film_2 = Film.new({
    'title' => 'The Shawshank Redemption',
    'price'=>19.94}),
  film_3 = Film.new({
    'title' => "Schindler''s List ",
    'price'=>19.93}),
  film_4 = Film.new({
    'title' => 'Raging Bull',
    'price'=>19.80}),
  film_5 = Film.new({
    'title' => 'Casablanca',
    'price'=>19.42}),
  film_6 = Film.new({
    'title' => 'Citizen Kane ',
    'price'=>'19.41'}),
  film_7 = Film.new({
    'title' => 'Gone with the Wind',
    'price'=> 19.39 }),
  film_8 = Film.new({
    'title' => 'The Wizard of Oz',
    'price'=>19.39}),
  film_9 = Film.new({
    'title' => "One Flew Over the Cuckoo''s Nest",
    'price'=>19.75}),
  film_10 = Film.new({
    'title' => 'Lawrence of Arabia',
    'price'=> 19.62})
]

for customer in customers_array do
customer.save
end
for film in films_array do
film.save
end

show_time_a = '11:30'
show_time_b = '12:30'
show_time_c = '13:37'

tickets_array = [
  ticket_1 = Ticket.new({
  'customer_id' => customer_1.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_a}),
ticket_2 = Ticket.new({
  'customer_id' => customer_2.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_3 = Ticket.new({
  'customer_id' => customer_3.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_4 = Ticket.new({
  'customer_id' => customer_4.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_b}),
ticket_5 = Ticket.new({
  'customer_id' => customer_5.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_6 = Ticket.new({
  'customer_id' => customer_6.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_a}),
ticket_7 = Ticket.new({
  'customer_id' => customer_7.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_c}),
ticket_8 = Ticket.new({
  'customer_id' => customer_8.id, 
  'film_id' => film_3.id,
  'show_time' => show_time_a}),
ticket_9 = Ticket.new({
  'customer_id' => customer_9.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_b}),
ticket_10 = Ticket.new({
  'customer_id' => customer_10.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_11 = Ticket.new({
  'customer_id' => customer_11.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_a}),
ticket_12 = Ticket.new({
  'customer_id' => customer_12.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_b}),
ticket_13 = Ticket.new({
  'customer_id' => customer_13.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_14 = Ticket.new({
  'customer_id' => customer_14.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_a}),
ticket_15 = Ticket.new({
  'customer_id' => customer_15.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_b}),
ticket_16 = Ticket.new({
  'customer_id' => customer_16.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_17 = Ticket.new({
  'customer_id' => customer_17.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_a}),
ticket_18 = Ticket.new({
  'customer_id' => customer_18.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_b}),
ticket_19 = Ticket.new({
  'customer_id' => customer_19.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_20 = Ticket.new({
  'customer_id' => customer_20.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_a}),
ticket_21 = Ticket.new({
  'customer_id' => customer_21.id, 
  'film_id' => film_1.id,
  'show_time' => show_time_b}),
ticket_22 = Ticket.new({
  'customer_id' => customer_21.id, 
  'film_id' => film_2.id,
  'show_time' => show_time_c}),
ticket_23 = Ticket.new({
  'customer_id' => customer_21.id, 
  'film_id' => film_3.id,
  'show_time' => show_time_a}),
ticket_24 = Ticket.new({
  'customer_id' => customer_21.id, 
  'film_id' => film_4.id,
  'show_time' => show_time_b}),
ticket_25 = Ticket.new({
  'customer_id' => customer_21.id, 
  'film_id' => film_5.id,
  'show_time' => show_time_c}),
ticket_26 = Ticket.new({
  'customer_id' => customer_6.id, 
  'film_id' => film_3.id,
  'show_time' => show_time_c}),
ticket_27 = Ticket.new({
  'customer_id' => customer_7.id, 
  'film_id' => film_3.id,
  'show_time' => show_time_c}),
ticket_28 = Ticket.new({
  'customer_id' => customer_8.id, 
  'film_id' => film_3.id,
  'show_time' => show_time_c})
]

#################################
##### SELL GODFATHER TICKETS ####
#################################

   ticket_1.sell_ticket
   ticket_4.sell_ticket
   ticket_7.sell_ticket
   ticket_12.sell_ticket
   ticket_21.sell_ticket
   
# # try selling one more. ticket_18

  #  ticket_18.sell_ticket
  #  Ticket.popular_show_time
  #  film_1.seats_taken
  #  ticket_7.popular_time


#################################
#### SELL SHAWSHANK TICKETS #####
#################################

   # ticket_3.sell_ticket
   # ticket_5.sell_ticket
   # ticket_6.sell_ticket
   # ticket_9.sell_ticket
   # ticket_22.sell_ticket

# # try selling one more ticket_11

# ticket_11.sell_ticket


#################################
#### COLIN BUYS MORE TICKETS ####
#################################

#     ticket_23.sell_ticket
#     ticket_24.sell_ticket
#     ticket_25.sell_ticket

#################################
#### SOME STUFF TO TRY       ####
#################################

# customer_21.tickets_bought
# customer_21.tickets_held
# film_1.seats_taken
# film_1.ticket_holders
# ticket_7.popular_time
# Ticket.popular_show_time
# ticket_27.sell_ticket
# Ticket.popular_show_time
# tickets_28.sell_ticket
# film_1.seats_taken




binding.pry

nil