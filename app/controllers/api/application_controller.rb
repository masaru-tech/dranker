class Api::ApplicationController < ActionController::Base
  include Knock::Authenticable
  include Rails::Pagination

  protect_from_forgery with: :null_session

  around_action :wrap_api

  respond_to :json

  private
    def wrap_api
      begin
        yield
      rescue => ex
        logger.error ex.message
        logger.error ex.backtrace.join("\n")

        head :internal_server_error
      end
    end
end
