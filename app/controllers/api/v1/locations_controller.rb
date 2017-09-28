class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Location.all.order(:state).order(:city)
    render json: @locations, status: 200
  end


end
