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

Customer.new("Andrew", "Oldham")
Customer.new("Andrew", "Zheng")
Customer.new("David", "Chase")
Customer.new("Jack", "He")
