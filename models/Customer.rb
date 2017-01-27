require_relative '../db/SqlRunner'

class Customer
  attr_reader :id, :customer_name, :funds
  def initialize(options)
    @id = options['id'].to_i
    @customer_name = options['customer_name']
    @funds = options['funds']
    #might want to change funds to big decimal
    #http://stackoverflow.com/questions/1019939/what-is-the-best-method-of-handling-currency-money
  end

  def save()
    sql = ("INSERT 
            INTO customers (customer_name,funds)
            VALUES ('#{@customer_name}','#{@funds}') 
            RETURNING id;")
    SqlRunner.run(sql).first['id'].to_i
  end
  def update()

  end

  def self.delete_all()
    sql = ("DELETE FROM customers;")
    SqlRunner.run(sql)
  end
  
  def self.all()
    sql = ("SELECT * 
            FROM customers;")
    SqlRunner.run(sql).map { |customer| Customer.new(customer)  }
  end
end