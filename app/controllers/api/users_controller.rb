class Api::UsersController < Api::ApplicationController
  skip_before_action :authenticate_user

  def create
    user = AppUser.create!(username: params[:display_name])
    jwt = auth_token(user)
    Token.create!({user_id: user.id, token: jwt.token})

    render json: jwt, status: :created
  end

  private
    def auth_token(entity)
      Knock::AuthToken.new payload: { sub: entity.id }
    end
end
