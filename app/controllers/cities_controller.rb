class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: { cities: @cities.pluck(:name) }
  end

  def sorted
    #@cities = City.sort_by_average_temperature
    @cities = City.order(average_temperature: :desc)
    render json: { cities: @cities.pluck(:name) }
  end
end