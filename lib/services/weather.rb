module Services
  class Weather
    def initialize
      @api_key = ENV['OPEN_WEATHER_API_KEY']
      @file = YAML.load_file('config/cities.yml')
    end

    def import_data
      return false if @file['cities'].empty?

      @file['cities'].each do |city_name|
        response = HTTParty.post('https://api.openweathermap.org/data/2.5/forecast', query: {'q': city_name, 'appid': @api_key})

        next if response['cod'].to_i != 200

        city = City.where(name: city_name).first_or_initialize
        city.data = response
        city.average_temperature = response['list'].sum { |period| (period['main']['temp_max'] + period['main']['temp_min']) / 2.0} / response['list'].count.to_f.round(2)
        
        city.save
      end

      true
    end
  end
end