class Rental
  attr_accessor :date

  def initialize(book, person, date = DateTime.now())
    @date = date
    self.book = book
    self.person = person
  end

  