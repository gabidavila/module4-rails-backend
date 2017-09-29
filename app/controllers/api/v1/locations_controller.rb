class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Location.all.order(:state).order(:city)
    render json: @locations, status: 200
  end

  def states
    @states = Location.group(:state).select(:state).pluck(:state)
    render json: @states.as_json, status: 200
  end

  def cities
    @cities = Location.where(state: params[:state]).order(:city)
    render json: @cities, status: 200
  end

end
