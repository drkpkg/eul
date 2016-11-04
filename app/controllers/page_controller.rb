class PageController < ApplicationController
  layout 'dashboard', only:[:dashboard]
  before_action :validate_user, only:[:dashboard]

  def index
  end

  def login
    if cookies[:user_id]
      # session[:current_user_id] = cookies[:user_id]
      redirect_to dashboard_url
    end
  end

  def dashboard
  end
end
