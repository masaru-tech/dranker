class Checkin < ApplicationRecord
  has_many :checkins_alcohols, dependent: :destroy
  has_many :alcohols, through: :checkins_alcohols
  belongs_to :user
  belongs_to :place

  delegate :username, to: :user
  delegate :name, to: :place, prefix: :place
end
