class OauthSessionsController < ApplicationController
  before_action :find_and_check_user

  def index
    @oauth_sessions = @user.oauth_sessions
  end

  def destroy
    @oauth_session = @user.oauth_sessions.find(params[:id])

    @oauth_session.destroy
    redirect_to user_oauth_sessions_path(@user)
  end

  private

  def find_and_check_user
    @user = User.find(params[:user_id])

    if current_user != @user
      error("User not found (id not authorized)", "is invalid (not owner)")
      false
    end
  end
end
