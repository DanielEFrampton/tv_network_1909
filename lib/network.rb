class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    @shows.collect_concat {|show| show.characters}.max_by {|char| char.salary}.actor
  end
end
