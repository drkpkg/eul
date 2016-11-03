class SessionController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if !@user.blank? and @user.password == params[:password]
      session[:current_user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      redirect_to dashboard_url
    end
  end

  def delete
    session[:current_user_id] = @user.id
    cookies.delete :user_id
    redirect_to root_path
  end
end
