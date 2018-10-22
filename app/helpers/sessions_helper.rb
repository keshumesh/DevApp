module SessionsHelper
 
 # Logs in the given user.
  def log_in(user) 
	session[:user_id] = user.id 
  end  
  
  # Returns the current logged-in user (if any).
  def current_user 
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(:_id => BSON::ObjectId(session[:user_id]["$oid"]))
    end
  end  
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in? 
	!current_user.nil? 
  end  

  # Confirms a logged-in user.
  def logged_in_user
      unless logged_in?
         redirect_to root_url
      end
  end

  
  #Log out the current user. 
  def log_out 
	session.delete(:user_id) 
	@current_user = nil 
  end

end
