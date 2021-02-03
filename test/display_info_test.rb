# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/neo_service'
require './lib/display_info'
require './lib/asteroid'
require './lib/near_earth_objects'

class DisplayInfoTest < MiniTest::Test
  def setup
    asteroids = NearEarthObjects.find_neos_by_date('2020-11-14')
    @display = DisplayInfo.new(asteroids)
  end

  def test_it_returns_the_most_characters_in_a_column
    assert_equal 18, @display.most_characters_in(:name)
  end
end
