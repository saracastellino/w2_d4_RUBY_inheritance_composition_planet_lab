class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    @planets.map {|planet| planet.name}
  end

  def get_planet_by_name(planet_name)
    @planets.find {|planet| planet.name == planet_name}
  end

  def get_largest_planet
      biggest_planet = @planets.map {|planet| planet.diameter}.max
      @planets.find {|planet| planet.diameter == biggest_planet}
  end
  #
  def get_smallest_planet
    smallest_planet = @planets.map {|planet| planet.diameter}.min
    @planets.find {|planet| planet.diameter == smallest_planet}
  end

  def get_planets_with_no_moons
    @planets.select {|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number)
    multiple_moons_planets = @planets.find_all {|planet| planet.number_of_moons > number}
    multiple_moons_planets.map {|planet| planet.name}
  end

  def get_number_of_planets_closer_than(number)
    closer_than_planets = @planets.find_all {|planet| planet.distance_from_sun < number}
    closer_than_planets.length
  end

  def get_total_number_of_moons
    @planets.reduce(0) {|total, planet| total += planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    distance_from_sun_planets = @planets.sort_by {|planet| planet.distance_from_sun}
    # binding.pry
    distance_from_sun_planets.map {|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing
    sorted_by_decreasing_size_planets = @planets.sort_by {|planet| planet.diameter}
    # binding.pry
    sorted_by_decreasing_size_planets.reverse.map {|planet| planet.name}
  end


end
