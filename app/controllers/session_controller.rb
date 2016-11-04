class SessionController < ApplicationController
  def create
    @status = false
    @user = User.find_by(email: params[:session][:email])
    begin
      if @user.authenticate(params[:session][:password])
        @status = true
        session[:current_user_id] = @user.id
        cookies.signed[:user_id] = @user.id
        redirect_to dashboard_url
      end
    rescue
      puts "Nothing here"
    end
  end

  def delete
    @_current_user = session[:current_user_id] = nil
    cookies.delete :user_id
    redirect_to root_path
  end
end


# rails g scaffold Receiver name phone address
# rails g scaffold package code references:container state:Integer fragility:Integer size:Integer weight:Float value:Float conveyance:Integer shipping_date:date delivery_date:date references:user references:receiver observations:Text
