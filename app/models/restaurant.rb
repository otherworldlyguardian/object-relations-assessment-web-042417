class Restaurant
  attr_accessor :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find do |rest|
      rest if rest.name == name
    end
  end

  def customers
    @reviews.collect do |review|
      review.customer
    end.uniq
  end

end

Restaurant.new("Lombardi")
Restaurant.new("Chipotle")
Restaurant.new("Taco John's")
Restaurant.new("Friday's")
