class Api::UsersController < Api::ApplicationController
  def create
    user = User.create!(username: params[:display_name])
    render json: auth_token(user), status: :created
  end

  private
    def auth_token(entity)
      Knock::AuthToken.new payload: { sub: entity.id }
    end
end
