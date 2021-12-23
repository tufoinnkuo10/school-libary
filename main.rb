# #!/usr/bin/env ruby

require_relative './person'
require_relative './student'
require_relative './rental'
require_relative './book'
require_relative './teacher'
require_relative './classroom'

# app class
class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def run
    puts 'Welcome to our School Library App!'

    loop do
      actions

      option = gets.chomp

      break if option == 'end'

      handle_action option
    end

    puts 'Hope the app was great!'
  end

  private

  def handle_action(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'This option is invalid/not available'
    end
  end

  def actions
    puts
    puts 'Enter a corresponding number to chose an option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts 'end - Exit'
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person
    puts 'Enter the number 1 to create Student'
    puts 'Enter the number 2 to create Teacher..'
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid ... please check and try again'
      nil
    end
  end

  def create_student
    print 'Enter Age: '
    age = gets.chomp

    print 'Enter Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)

    puts 'Person(student) has been created successfully'
  end

  def create_teacher
    print 'Enter Age: '
    age = gets.chomp

    print 'Enter Name: '
    name = gets.chomp

    print 'Your Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people.push(teacher)

    puts 'Person(Teacher) has been created successfully'
  end

  def create_book
    print 'Enter Book Title: '
    title = gets.chomp

    print 'Author Name: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book successfully Created'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, i| puts "#{i}) #{book}" }
    book_i = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index { |person, i| puts "#{i}) #{person}" }
    person_i = gets.chomp.to_i
    puts
    print 'Enter Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_i], @people[person_i])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
  end
end

def main
  app = App.new
  app.run
end

main
