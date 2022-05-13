require_relative('./nameable')
require_relative('./capitalizedecorator')
require_relative('./trimmerdecorator')

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private :of_age?
end