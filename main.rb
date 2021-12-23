#!/usr/bin/env ruby

require_relative './person'
require_relative './student'
require_relative './rental'
require_relative './book'
require_relative './teacher'
require_relative './clasroom'

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

      break if option == "end"

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

  