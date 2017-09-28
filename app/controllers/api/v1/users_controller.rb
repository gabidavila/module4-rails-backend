class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 400
    end
  end

  def update

  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: 200
  end


private

  def user_params
    params.permit(:name, :email, :password, :twitter_username, :image_uri, :bio)
  end
end
