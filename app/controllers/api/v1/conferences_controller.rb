class Api::V1::ConferencesController < ApplicationController

  def index
    # if params(:someparams)
    #   @conferences = Conference.all.order(:start_date)
    #   render json: @conferences, status: 200
    # else

      render json: fetch, status: 200
    # end

  end

  def create
    @conference = Conference.new(conference_params)
    if @conference.valid?
      @conference.save
      render json: @conference, status: 201
    else
      render json: @conference.errors, status: 400
    end
  end

  def show
    @conference = Conference.find_by(id: params[:id])
    render json: @conference, status: 200
  end

  def update

  end

private

  def fetch
    # binding.pry
    @conferences = Conference.all.order(:start_date)
    @conferences = @conferences.where(location_id: params[:city_id]).order(:start_date) if params[:city_id] != ""
    @conferences = Conference.joins(:location).where("locations.state ILIKE ?", "%#{params[:state]}%").order(:start_date) if params[:state] && params[:city_id] == ""

    @conferences
  end

  def conference_params
    params.permit(:name, :description, :url, :image_uri, :start_date, :end_date, :location_id, :address, :organizer_id)
  end
end
