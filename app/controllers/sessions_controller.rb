class SessionsController < ApplicationController
  def new 
      if logged_in? 
	redirect_to '/dashboard'
      end 
  end
  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user.present? && @user.password == params[:password]
	   session[:user_id] = @user.id
	   redirect_to dashboard_url
    else
     flash[:notice] = "Email or password is invalid"
      #render "new"
     redirect_to '/login'
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
