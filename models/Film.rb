class Film
  attr_reader :id
  attr_accessor :title, :price, :tickets_avail
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options["price"].to_f
    @tickets_avail = 5
  end
  #CRUD actions (create, read, update, delete) customers, films and tickets.
  def save()
    sql = ("INSERT
     INTO films (title,price, tickets_avail)
     VALUES ('#{@title}','#{@price}', #{@tickets_avail})
     RETURNING id;")
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def update()
    sql = ("UPDATE films
      SET (title, price, tickets_avail) =
      ('#{@title}', #{@price}, #{tickets_avail})
      WHERE id = #{@id}")
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE
    FROM films
    WHERE id=#{@id}"
    SqlRunner.run(sql)
  end


  def seats_taken
    sql = "SELECT * FROM tickets
           WHERE film_id = #{@id};"
    SqlRunner.run(sql).count
  end

  def ticket_holders
    sql = "SELECT c.customer_name, f.title, t.show_time
           FROM customers c
           INNER JOIN tickets t
           ON c.id = t.customer_id
           INNER JOIN films f
           ON f.id = t.film_id
           WHERE f.id = #{@id};"
    SqlRunner.run(sql).map { |ticket_holder| TicketHolder.new(ticket_holder) }
  end

  def self.find_by_id(id_to_find)
    sql = ("SELECT * FROM films
           WHERE id = #{id_to_find};")
    SqlRunner.run(sql).first
  end

  def self.delete_all()
    sql = ("DELETE FROM films;")
    SqlRunner.run(sql)
  end

  def self.all()
    sql = ("SELECT * 
      FROM films")
    SqlRunner.run(sql).map{ |film| Film.new(film) }
  end
end