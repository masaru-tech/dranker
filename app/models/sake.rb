class Sake < Alcohol
  acts_as_taggable

  has_one :sake_info, foreign_key: :alcohol_id
end
