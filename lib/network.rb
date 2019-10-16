class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  # Helper method
  def all_characters
    @shows.collect_concat {|show| show.characters}
  end

  def highest_paid_actor
    all_characters.max_by {|char| char.salary}.actor
  end

  def payroll
    all_characters.reduce({}) do |hash, char|
      hash[char.actor] = char.salary
      hash
    end
  end
end
