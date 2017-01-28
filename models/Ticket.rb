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
    SqlRunner.run(sql)[0]
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

  def sell_ticket(customer, film)
    customer.funds -= film.price
    customer.update()
  end
end