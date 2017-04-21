class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    login(params[:user][:email], params[:user][:password])

    logout unless current_user.admin

    redirect_to admin_dashboard_path
  end

  def destroy
    logout

    redirect_to new_session_path
  end
end
