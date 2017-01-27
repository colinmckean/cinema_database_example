require 'pry-byebug'
require_relative './models/Film'
require_relative './models/Ticket'
require_relative './models/Customer'

customer1 = Customer.new('customer_name' => 'Alan',
  'funds' => '100')
customer1.save
film_1 = Film.new('title' => 'Star Wars',
 'price'=>'3.50')
film_1.save
binding.pry

nil