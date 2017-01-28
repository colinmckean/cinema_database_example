class TicketHolder
  attr_reader :id
  attr_accessor :title, :customer_name
  def initialize(options)
    @title = options['title']
    @customer_name = options["customer_name"]
  end
end