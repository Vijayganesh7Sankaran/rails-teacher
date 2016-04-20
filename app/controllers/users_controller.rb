class UsersController < ApplicationController
layout "login"
def new
	@user = User.new
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
	@user1=User.new
end
def update
		#@user1 = @current_user.id
	profile_pic
    @user1.update_attributes( params.require(:user).permit(:photo) )
    if @user1.save
    	redirect_to :controller => 'quizzes', :action => 'user'
    end
end

private
def profile_pic
@current_user ||= User.find(session[:user_id]) if session[:user_id]
@user1 = User.find_by_id(@current_user.id)
end


	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
