class City < ApplicationRecord
  def self.sort_by_average_temperature
    City.all.sort_by { |city| city.data['list'].sum { |period| (period['main']['temp_max'] + period['main']['temp_min']) / 2.0} / city.data['list'].count.to_f }.reverse!
  end
end