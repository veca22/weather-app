class CitiesController < ApplicationController
  def index
    @cities = City.all.pluck(:name)
    render json: { cities: @cities }
  end

  def sorted
    @cities = City.sorted_by_average_temperature
    render json: { cities: @cities.pluck(:name) }
  end
end