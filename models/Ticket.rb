class Ticket
  attr_accessor :id, :customer_id, :film_id
  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = ("INSERT
            INTO tickets (customer_id, film_id)
            VALUES ('#{@customer_id}', '#{@film_id}')
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
end