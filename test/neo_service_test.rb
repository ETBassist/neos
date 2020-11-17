require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid'
require './lib/neo_service'

class NEOServiceTest < MiniTest::Test
  def test_it_returns_asteroid_object
    asteroids = NEOService.parse_neos_data_from('2019-03-30')
    asteroids.each do |asteroid|
      assert_instance_of Asteroid, asteroid
    end

    sorted_asteroids_by_size = asteroids.sort_by do |asteroid|
      asteroid.estimated_diameter
    end

    assert_equal "(2019 UZ)", sorted_asteroids_by_size[0].name
    assert_equal 51.289094295, sorted_asteroids_by_size[0].estimated_diameter
    assert_equal "37755577.3604636944", sorted_asteroids_by_size[0].miss_distance
  end
end
