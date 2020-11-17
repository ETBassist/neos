class DisplayInfo
  attr_reader :asteroid_list,
              :total_number_of_asteroids,
              :largest_asteroid

  def initialize(data)
    @asteroid_list = data[:asteroid_list]
    @total_number_of_asteroids = data[:total_number_of_asteroids]
    @largest_asteroid = data[:largest_asteroid]
  end
  
  def most_characters_in(column)
    character_counts = @asteroid_list.map do |asteroid|
      asteroid[column].size
    end
    character_counts.max
  end
end
