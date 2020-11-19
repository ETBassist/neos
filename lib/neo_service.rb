require 'faraday'
require 'figaro'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../../config/application.yml', __FILE__))
Figaro.load

class NEOService
  def self.parse_neos_data_from(date)
    connection = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    asteroids_list_response = connection.get('/neo/rest/v1/feed')
    parsed_asteroids_data = JSON.parse(asteroids_list_response.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]

    parsed_asteroids_data.map { |asteroid_data| Asteroid.new(asteroid_data) }
  end
end
