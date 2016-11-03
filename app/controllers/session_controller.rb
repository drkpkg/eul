class SessionController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    begin
      if @user.password == params[:session][:password]
        session[:current_user_id] = @user.id
        cookies.signed[:user_id] = @user.id
        redirect_to dashboard_url
      end
    rescue
      puts "Nothing here"
    end
  end

  def delete
    session[:current_user_id] = nil
    cookies.delete :user_id
    redirect_to root_path
  end
end
