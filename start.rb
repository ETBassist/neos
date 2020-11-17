require './lib/display_info'
require './lib/near_earth_objects'

DisplayInfo.show_date_prompt

date = gets.chomp
asteroid_details = NearEarthObjects.find_neos_by_date(date)
display = DisplayInfo.new(asteroid_details)
display.asteroid_table(date)
