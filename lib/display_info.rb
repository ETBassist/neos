# frozen_string_literal: true

class DisplayInfo
  def initialize(data)
    @asteroid_list = data[:asteroid_list]
    @total_number_of_asteroids = data[:total_number_of_asteroids]
    @largest_asteroid = data[:biggest_asteroid]
    @column_data = create_columns
  end

  def self.show_date_prompt
    puts '________________________________________________________________________________________________________________________________'
    puts 'Welcome to NEO. Here you will find information about how many meteors, asteroids, comets pass by the earth every day.'
    puts 'Enter a date below to get a list of the objects that have passed by the earth on that day.'
    puts 'Please enter a date in the following format YYYY-MM-DD.'
    print '>>'
  end

  def asteroid_table(date)
    formatted_date = DateTime.parse(date).strftime('%A %b %d, %Y')
    puts '______________________________________________________________________________'
    puts "On #{formatted_date}, there were #{@total_number_of_asteroids} objects that almost collided with the earth."
    puts "The largest of these was #{@largest_asteroid} ft. in diameter."
    puts "\nHere is a list of objects with details:"
    puts divider
    puts header
    create_rows
    puts divider
  end

  private

  def header
    "| #{@column_data.map { |_, column| column[:label].ljust(column[:width]) }.join(' | ')} |"
  end

  def divider
    "+-#{@column_data.map { |_, column| '-' * column[:width] }.join('-+-')}-+"
  end

  def create_rows
    @asteroid_list.each { |asteroid| puts "| #{format_row_data(asteroid)} |" }
  end

  def format_row_data(row_data)
    row_data.keys.map { |key| row_data[key].ljust(@column_data[key][:width]) }.join(' | ')
  end

  def create_columns
    column_labels = { name: 'Name', diameter: 'Diameter', miss_distance: 'Missed The Earth By:' }
    column_labels.each_with_object({}) do |(column, label), hash|
      hash[column] = {
        label: label,
        width: [most_characters_in(column), label.size].max
      }
    end
  end

  def most_characters_in(column)
    @asteroid_list.map { |asteroid| asteroid[column].size }.max
  end
end
