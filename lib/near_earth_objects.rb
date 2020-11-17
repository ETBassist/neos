require './lib/neo_service'
require './lib/asteroid'

class NearEarthObjects
  def self.find_neos_by_date(date)
    asteroids = NEOService.parse_neos_data_from(date)

    {
      asteroid_list: format_asteroid_data(asteroids),
      biggest_asteroid: largest_by_diameter(asteroids),
      total_number_of_asteroids: asteroids.count
    }
  end

  module FormatAsteroids
    private

    def format_asteroid_data(asteroids)
      asteroids.map do |asteroid|
        {
          name: asteroid.name,
          diameter: "#{asteroid.estimated_diameter.to_i} ft",
          miss_distance: "#{asteroid.miss_distance.to_i} miles"
        }
      end
    end

    def largest_by_diameter(asteroids)
      largest_asteroid = asteroids.max_by { |asteroid| asteroid.estimated_diameter }
      largest_asteroid.estimated_diameter.to_i
    end
  end

  extend FormatAsteroids
end
