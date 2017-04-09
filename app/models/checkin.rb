class Checkin < ApplicationRecord
  has_many :checkins_alcohols, dependent: :destroy
  has_many :alcohols, through: :checkins_alcohols
  belongs_to :user

  delegate :username, to: :user
end
