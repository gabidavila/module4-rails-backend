class Api::V1::ConferencesController < ApplicationController
  before_action :load_conference

  def index
    render json: fetch, status: 200
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
    render json: @conference, status: 200
  end

  def update

  end

  def states
    states = Conference.joins(:location).group("locations.state").select("locations.state, count(*) as total").pluck(:state)
    render json: states.sort, status: 200
  end

  private

  def fetch
    @conferences = Conference.all.order(:start_date)
    @conferences = @conferences.where(location_id: params[:city_id]).order(:start_date) if params[:city_id] != "" && !params[:city_id].nil?
    @conferences = Conference.joins(:location).where("locations.state ILIKE ?", "%#{params[:state]}%").order(:start_date) if params[:state] && params[:city_id] == ""

    @conferences
  end

  def conference_params
    params.permit(:name, :description, :url, :image_uri, :start_date, :end_date, :location_id, :address, :organizer_id)
  end

  def load_conference
    @conference = Conference.find_by(id: params[:id])
  end
end
