# link with corrector
require_relative('./corrector')

# Initialize Person class
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  # Add private method

  private

  def of_age?
    @age >= 18
  end

  # add method to validate corrected name

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  # Public method

  def can_use_services?
    of_age? || @parent_permission
  end
end
