class Customer
  attr_accessor :first_name, :last_name, :reviews

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    test = name.split(" ")
    @@all.find do |cust|
      cust.first_name == test[0] && cust.last_name == test[1]
    end
  end

  def self.find_all_by_first_name(name)
    @@all.collect do |cust|
      cust if cust.first_name == name
    end.compact
  end

  def self.all_names
    @@all.collect do |cust|
      "#{cust.first_name} #{cust.last_name}"
    end
  end

  def add_review(restaurant, content)
    Review.new(restaurant, self, content)
  end

end

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
