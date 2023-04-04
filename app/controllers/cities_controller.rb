class CitiesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @cities = City.all
    render json: { cities: @cities.pluck(:name) }
  end

  def average_temperatures
    @cities = City.average_temperatures(cities: params['cities'].presence || YAML.load_file('config/cities.yml')['cities'], start_interval: (params['start_interval'].presence || 0).to_i, end_interval: (params['end_interval'].presence || 39).to_i)
    render json: { cities: @cities }
  end

  def sorted
    #@cities = City.sort_by_average_temperature
    @cities = City.order(average_temperature: :desc)
    render json: { cities: @cities.pluck(:name) }
  end
end