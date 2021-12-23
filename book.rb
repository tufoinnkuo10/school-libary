require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # method for rental

  def add_rental(person, date)
    Rental.new(@title, person, date)
  end
end
