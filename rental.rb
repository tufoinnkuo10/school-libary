class Rental
  attr_accessor :book, :person, :date

  def initialize(book, person, date = DateTime.now())
    @date = date
    @book = book
    @person = person
    @book.rentals.push(self) unless @book.rentals.include?(self)
    @person.rentals.push(self) unless @person.rentals.include?(self)
    
  end
end
