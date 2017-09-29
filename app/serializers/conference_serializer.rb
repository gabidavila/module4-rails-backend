class ConferenceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :talks, :url, :start_date, :end_date, :address, :location, :organizer, :image_uri
end
