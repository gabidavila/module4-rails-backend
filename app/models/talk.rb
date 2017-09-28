class Talk < ApplicationRecord
  belongs_to :speaker, foreign_key: :speaker_id, class_name: "User"
  belongs_to :conference
  has_one :location, through: :conference
end
