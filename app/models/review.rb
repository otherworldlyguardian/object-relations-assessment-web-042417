class Review
  attr_reader :restaurant, :customer, :content

  @@all = []

  def initialize(restaurant, customer, content)
    @restaurant, @customer, @content = restaurant, customer, content
    @restaurant.reviews << self
    @customer.reviews << self
    @@all << self
  end

  def self.all
    @@all
  end

end
