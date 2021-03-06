class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user, :require_user_user
  
  @@badge_beg = 0
def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
end
def require_user_admin
  if current_user
    if current_user.role != 'admin' 
    
  	redirect_to '/signup' 
  	end
  end
end
def require_user
  redirect_to '/signup' unless current_user
end

  def require_user_user
  if current_user
    if current_user.role == 'admin' 
    
  	redirect_to '/signup'
   end
  end		
  end
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
