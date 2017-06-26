require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dranker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :ja

    schema_file = "#{Rails.root}/app/docs/schema/schema.json"
    if File.exists?(schema_file)
      config.middleware.use Committee::Middleware::RequestValidation, schema: JSON.parse(File.read(schema_file)), strict: true, prefix: '/api'
    end
  end
end
