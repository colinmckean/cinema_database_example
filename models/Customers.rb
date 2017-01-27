require_relative '../db/SqlRunner'

class Customers
  attr_reader :customer_name, :funds
  def initialize(options)
    @customer_name = options['customer_name']
    @funds = options['funds']
    #might want to change funds to big decimal
    #http://stackoverflow.com/questions/1019939/what-is-the-best-method-of-handling-currency-money
  end

  def save()
    sql = ("INSERT 
            INTO customers (customer_name,funds)
            VALUES ('Colin','5'); 
            RETURNING *;")
    SqlRunner.run(sql)
  end
end