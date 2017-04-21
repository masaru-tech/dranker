class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = login(params[:user][:email], params[:user][:password])

    logout unless user&.admin

    redirect_back_or_to admin_dashboard_path
  end

  def destroy
    logout

    redirect_to new_session_path
  end
end
