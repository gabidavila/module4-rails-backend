class Api::V1::TalksController < ApplicationController

  def index
    @talks = Talk.where(conference_id: params[:conference_id]).order(:title)
    render json: @talks, status: 200
  end

  def create
    @talk = Talk.new(talk_params)
    @talk.conference_id = params[:conference_id]
    if @talk.valid?
      @talk.save
      render json: @talk, status: 201
    else
      render json: @talk.errors, status: 400
    end
  end

  def show
    @talk = Talk.find_by(id: params[:id])
    render json: @talk, status: 200
  end

  def show_all
    @talks = Talk.order(:title)
    render json: @talks, status: 200
  end

  def update

  end

private

  def talk_params
    params.permit(:title, :description, :topic, :speaker_id)
  end

end
