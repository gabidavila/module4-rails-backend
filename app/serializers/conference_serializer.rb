class ConferenceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :talks, :url, :start_date, :end_date, :address, :location, :organizer, :image_uri, :year, :month

  def year
    object.start_date.year
  end

  def month
    object.start_date.month
  end
end
