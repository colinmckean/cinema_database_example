require 'pry-byebug'
require_relative './models/Films'
require_relative './models/Tickets'
require_relative './models/Customers'

customer1 = Customers.new('customer_name' => 'Alan',
  'funds' => '100')
customer1.save
film_1 = Films.new('title' => 'Star Wars',
 'price'=>'3.50')
film_1.save
binding.pry

nil