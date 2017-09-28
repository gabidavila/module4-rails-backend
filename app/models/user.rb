class User < ApplicationRecord
  has_many :talks, foreign_key: :speaker_id
  has_many :conferences, through: :talks, foreign_key: :organizer_id

end
