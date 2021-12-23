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

  