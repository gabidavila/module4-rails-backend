class Conference < ApplicationRecord
  has_many :talks
  belongs_to :organizer, foreign_key: :organizer_id, class_name: "User"
  belongs_to :location

end
