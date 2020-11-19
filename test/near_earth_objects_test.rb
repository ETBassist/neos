require 'minitest/autorun'
require 'minitest/pride'
require './lib/near_earth_objects'
require 'mocha/minitest'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    asteroids = {:asteroid_list=>
        [{:name=>"(2011 GE3)", :diameter=>"123 ft", :miss_distance=>"35542652 miles"},
        {:name=>"(2011 GK44)", :diameter=>"147 ft", :miss_distance=>"10701438 miles"},
        {:name=>"(2019 FT)", :diameter=>"512 ft", :miss_distance=>"5503325 miles"},
        {:name=>"(2019 FS1)", :diameter=>"134 ft", :miss_distance=>"6241521 miles"},
        {:name=>"(2019 FQ2)", :diameter=>"70 ft", :miss_distance=>"2788140 miles"},
        {:name=>"(2019 GB)", :diameter=>"81 ft", :miss_distance=>"553908 miles"},
        {:name=>"(2019 GN1)", :diameter=>"147 ft", :miss_distance=>"9626470 miles"},
        {:name=>"(2019 GN3)", :diameter=>"537 ft", :miss_distance=>"35277204 miles"},
        {:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"},
        {:name=>"(2019 UZ)", :diameter=>"51 ft", :miss_distance=>"37755577 miles"}],
      :biggest_asteroid=>537,
      :total_number_of_asteroids=>10}

    NearEarthObjects.expects(:find_neos_by_date).returns(asteroids)
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2011 GE3)', results[:asteroid_list][0][:name]
  end
end
