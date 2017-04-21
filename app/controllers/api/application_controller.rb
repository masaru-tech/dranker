class Api::ApplicationController < ActionController::Base
  include Knock::Authenticable
  include Rails::Pagination

  protect_from_forgery with: :null_session

  before_action :authenticate_app_user

  around_action :wrap_api

  respond_to :json

  private
    def authenticate_app_user
      authenticate_for AppUser
    end

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
