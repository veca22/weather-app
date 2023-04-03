module Services
  class Weather
    def initialize
      @api_key = ENV['OPEN_WEATHER_API_KEY']
      @cities = ENV['CITIES'].split(',')
    end

    def import_data
      @cities.each do |city_name|
        response = HTTParty.post('https://api.openweathermap.org/data/2.5/forecast', query: {'q': city_name, 'appid': @api_key})

        next if response['cod'].to_i != 200

        city = City.where(name: city_name).first_or_initialize
        city.data = response
        
        city.save
      end
    end
  end
end