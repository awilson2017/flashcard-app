class ApplicationController < ActionController::API

  # decodes the JWT token, takes the login, finds user in DB, and then stores it in instance var.
  def current_user
    token = params[:token]
    payload = TokiToki.decode(token)
    @current_user ||= User.find_by_login(payload[0]['sub'])
  end

  # boolean of whether or not we can find user in DB
  def logged_in?
    current_user != nil
  end

  # generates a 400's error if we cannot find the user
  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end
