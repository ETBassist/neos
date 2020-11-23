require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/asteroid'
require './lib/near_earth_objects'
require './test_data/neo_response'
require 'mocha/minitest'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    asteroids = NEOResponse::DATA.map do |asteroid_data|
      Asteroid.new(asteroid_data)
    end

    NEOService.expects(:parse_neos_data_from).returns(asteroids)
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2011 GE3)', results[:asteroid_list][0][:name]
  end
end
