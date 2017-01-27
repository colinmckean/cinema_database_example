class Film
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end
  #CRUD actions (create, read, update, delete) customers, films and tickets.
  def save()
    sql = ("INSERT
     INTO films (title,price)
     VALUES ('#{@title}','#{@price}')
     RETURNING id;")
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def update()
    sql = ("UPDATE films
      SET (title, price) =
      ('#{@title}', '#{@price}')
      WHERE id = #{@id}")
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE
    FROM films
    WHERE id=#{@id}"
    SqlRunner.run(sql)
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