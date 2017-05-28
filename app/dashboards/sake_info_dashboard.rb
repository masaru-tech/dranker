require "administrate/base_dashboard"

class SakeInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    alcohol: Field::BelongsTo,
    id: Field::Number,
    kuramoto: Field::String,
    locality: Field::String,
    raw_rice: Field::String,
    cleaning_rate: Field::String,
    nihonsyu_degree: Field::String,
    amino_degree: Field::Number.with_options(decimals: 2),
    alcohol_content: Field::String,
    acidit: Field::Number.with_options(decimals: 2),
    use_yeast: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :alcohol,
    :id,
    :kuramoto,
    :locality,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :alcohol,
    :id,
    :kuramoto,
    :locality,
    :raw_rice,
    :cleaning_rate,
    :nihonsyu_degree,
    :amino_degree,
    :alcohol_content,
    :acidit,
    :use_yeast,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :alcohol,
    :kuramoto,
    :locality,
    :raw_rice,
    :cleaning_rate,
    :nihonsyu_degree,
    :amino_degree,
    :alcohol_content,
    :acidit,
    :use_yeast,
  ].freeze

  # Overwrite this method to customize how sake infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sake_info)
  #   "SakeInfo ##{sake_info.id}"
  # end
end
