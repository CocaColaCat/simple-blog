class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token

  before_action :fetch_current_user

  def fetch_current_user
    @current_user = AdminUser.find_by_id(session[:user_id])
  end

  def current_user
    @current_user
  end

end
