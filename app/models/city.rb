class City < ApplicationRecord
  def self.sort_by_average_temperature
    City.all.sort_by { |city| city.data['list'].sum { |period| (period['main']['temp_max'] + period['main']['temp_min']) / 2.0} / city.data['list'].count.to_f }.reverse!
  end

  def self.average_temperatures(cities: [], start_interval: 0, end_interval: 39)
    return {} if start_interval < 0 || start_interval > end_interval || end_interval > 39
    
    return cities.map { |city_name| [city_name, City.find_by(name: city_name).average_temperature] }.to_h if start_interval == 0 && end_interval == 39

    averages = {}

    cities.each do |city_name|
      city = City.find_by(name: city_name)
      intervals = city.data['list'].select.with_index { |interval, index| (start_interval..end_interval).include?(index) }
      average_temperature = intervals.sum {|period| (period['main']['temp_max'] + period['main']['temp_min']) / 2.0} / intervals.count.to_f
      averages[city_name] = average_temperature.round(2)
    end
    
    averages
  end
end