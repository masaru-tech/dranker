class CheckinsAlcohol < ApplicationRecord
  belongs_to :checkin
  belongs_to :alcohol
end
