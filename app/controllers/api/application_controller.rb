class Api::ApplicationController < ActionController::Base
  include Knock::Authenticable
  include Rails::Pagination

  protect_from_forgery with: :null_session

  respond_to :json
end
