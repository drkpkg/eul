class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def validate_user
    if !current_user
      redirect_to login_url
    end
  end

  private

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

end
