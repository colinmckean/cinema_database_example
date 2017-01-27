class Films
  attr_reader :title, :price
  def initialize(options)
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = ("INSERT
               INTO films (title,price)
               VALUES ('#{@title}','#{@price}')
               RETURNING *;")
    SqlRunner.run(sql)
  end
end