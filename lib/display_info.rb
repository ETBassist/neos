class DisplayInfo
  attr_reader :asteroid_list,
              :total_number_of_asteroids,
              :largest_asteroid

  def initialize(data)
    @asteroid_list = data[:asteroid_list]
    @total_number_of_asteroids = data[:total_number_of_asteroids]
    @largest_asteroid = data[:largest_asteroid]
  end

  def self.show_date_prompt
    puts "________________________________________________________________________________________________________________________________"
    puts "Welcome to NEO. Here you will find information about how many meteors, asteroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
    puts "Please enter a date in the following format YYYY-MM-DD."
    print ">>"
  end

  def asteroid_table(date)
    formatted_date = DateTime.parse(date).strftime("%A %b %d, %Y")
    columns = create_columns
    puts "______________________________________________________________________________"
    puts "On #{formatted_date}, there were #{@total_number_of_asteroids} objects that almost collided with the earth."
    puts "The largest of these was #{@largest_asteroid} ft. in diameter."
    puts "\nHere is a list of objects with details:"
    puts divider(columns)
    puts header(columns)
    create_rows(columns)
    puts divider(columns)
  end
  
  def header(column_data)
    "| #{ column_data.map { |_,column| column[:label].ljust(column[:width]) }.join(' | ') } |"
  end

  def divider(column_data)
    "+-#{column_data.map { |_,column| "-"*column[:width] }.join('-+-') }-+"
  end

  def create_rows(column_info)
    @asteroid_list.each { |asteroid| puts "| #{format_row_data(asteroid, column_info)} |" }
  end

  def format_row_data(row_data, column_info)
    row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
  end

  def create_columns
    column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
    column_labels.each_with_object({}) do |(column, label), hash|
      hash[column] = {
        label: label,
        width: [most_characters_in(column), label.size].max
      }
    end
  end

  def most_characters_in(column)
    character_counts = @asteroid_list.map do |asteroid|
      asteroid[column].size
    end
    character_counts.max
  end
end
