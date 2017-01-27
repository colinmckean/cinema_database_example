class Film
  attr_reader :id, :title, :price
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
    SqlRunner.run(sql).first['id'].to_i
  end
  def update()
    
  end

  def self.delete_all()
  end
  
  def self.all()
    sql = ("SELECT * 
            FROM films")
    SqlRunner.run(sql).map{ |film| Film.new(film) }
  end
end