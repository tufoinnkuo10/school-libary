class Book
  attr_accessor :title, :author, :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # method for rental

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end
end
