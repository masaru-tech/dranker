class Alcohol < ApplicationRecord
  has_many :checkins_alcohols
  has_many :checkins, through: :checkins_alcohols
end
