# frozen_string_literal: true

class Asteroid
  attr_reader :name,
              :miss_distance,
              :estimated_diameter

  def initialize(response_data)
    @name = response_data[:name]
    @miss_distance = response_data[:close_approach_data][0][:miss_distance][:miles]
    @estimated_diameter = response_data[:estimated_diameter][:feet][:estimated_diameter_max]
  end
end
