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

      break if option >= 7

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

  

main