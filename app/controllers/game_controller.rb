class GameController < ApplicationController
layout "dashboard"
before_filter :set_cache_buster, :require_user
  def view
  end
  def admin
    render :layout => 'admin'
    @admin = Quiz.new
  end
  def thechaostone
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		if @user1.role == "admin"
			render :layout => 'adminHomepage'
		else
			render :layout => 'userHomepage'
		end
  end
end
