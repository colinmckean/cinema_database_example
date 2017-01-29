class Ticket
  attr_accessor :id, :customer_id, :film_id, :show_time
  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
  end

  def save()
    sql = ("INSERT
            INTO tickets (customer_id, film_id, show_time)
            VALUES ('#{@customer_id}', '#{@film_id}', '#{show_time}')
            RETURNING id;")
    @id = SqlRunner.run(sql).first['id'].to_i
  end
  def update()
    sql = ("UPDATE tickets
            SET (customer_id, film_id) = 
            (#{@customer_id}, #{film_id})
            WHERE id = #{@id};")
            SqlRunner.run(sql)
  end

  def delete()
    sql = ("DELETE
            FROM tickets
            WHERE id = #{id};")
    SqlRunner.run(sql)
  end

  def self.popular_show_time
    sql = ("SELECT show_time
    FROM tickets
    GROUP BY show_time
    ORDER BY COUNT(*) DESC
    LIMIT    1;")
    SqlRunner.run(sql)[0]["show_time"]
  end

  def popular_time
    sql = ("SELECT film_id, show_time
    FROM tickets
    WHERE film_id = #{@film_id}
    GROUP BY show_time, film_id
    ORDER BY COUNT(*) DESC
    LIMIT    1;")
    SqlRunner.run(sql)[0]["show_time"]
  end

  def self.delete_all()
    sql = ("DELETE
            FROM tickets;")
    SqlRunner.run(sql)
  end

  def self.all()

    sql = "SELECT * 
           FROM tickets"
    SqlRunner.run(sql).map { |ticket| Ticket.new(ticket)  }
  end

  def sell_ticket()
    customer_funds = Customer.find_by_id(@customer_id)['funds']
    film_price = Film.find_by_id(@film_id)['price']
    tickets_avail = Film.find_by_id(@film_id)['tickets_avail'].to_i

    if tickets_avail > 0
      customer_funds[0] = ''
      film_price[0] = ''
      customer_funds = customer_funds.to_f
      film_price = film_price.to_f
      result = customer_funds - film_price
      result.round(2)
      customer_to_find = Customer.find_by_id(@customer_id)
      customer_to_find['funds'] = result

      sql = "UPDATE customers
      SET (funds) =
      (#{result})
      WHERE id = #{@customer_id};"
      SqlRunner.run(sql)
      
      tickets_to_update = Film.find_by_id(@film_id)['tickets_avail'].to_i
      tickets_to_update -= 1

      sql = "UPDATE films
      SET (tickets_avail) =
      (#{tickets_to_update})
      WHERE id = #{@film_id};"
      SqlRunner.run(sql)
  # customer_to_find.update()
  #   if film.tickets_avail > 0
  #   @customer_id = customer.id
  #   @film_id = film.id
  #   @show_time = self.show_time
      self.save
  #   customer.funds -= film.price
  #   film.tickets_avail -= 1
  #   customer.update()
  #   film.update()
  # end
end
end
end