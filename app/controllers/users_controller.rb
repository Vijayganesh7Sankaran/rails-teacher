class UsersController < ApplicationController
	layout "login"
	before_filter :set_cache_buster, :require_user, :only => :user_profile
	def new
		@user1 = User.new
	end
	def create
		@user1=User.new(user_params)
		if @user1.save
			session[:user_id] = @user1.id
			redirect_to '/user'
		else 
			redirect_to '/signup'
		end
	end
	
	def login
		@user=User.new
	end
	
	def update
			#@user1 = @current_user.id
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
	    @user1.update_attributes( params.require(:user).permit(:photo) )
	    if @user1.save && @current_user.role != 'admin'
	    	redirect_to :controller => 'quizzes', :action => 'user'
    	elsif @user1.save && @current_user.role == 'admin'
    		redirect_to :controller => 'quizzes', :action => 'admin'
    	end
	end
	
	def user_profile
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		if @user1.role == "admin"
			render :layout => 'adminHomepage'
		else
			render :layout => 'userHomepage'
		end
	end


	def profile_pic
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
	end
	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
