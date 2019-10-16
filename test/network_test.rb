require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/show'
require './lib/character'

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_initializes_with_name_and_no_shows
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_can_return_name_of_highest_paid_actor_among_all_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end

  def test_it_can_return_hash_of_payroll_with_actors_and_salaries
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    expected_hash = {
                      "David Hasselhoff" => 1600000,
                      "William Daniels" => 1000000,
                      "Amy Poehler" => 2000000,
                      "Nick Offerman" => 1400000
                    }
    assert_equal expected_hash, @nbc.payroll
  end
end
