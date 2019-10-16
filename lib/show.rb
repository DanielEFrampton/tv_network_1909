class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.reduce(0) do |total_salary, character|
      total_salary += character.salary
    end
  end

end
