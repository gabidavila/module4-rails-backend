class Location < ApplicationRecord
  has_many :conferences
  has_many :talks, through: :conferences
end
