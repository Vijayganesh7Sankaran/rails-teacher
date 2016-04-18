class UsersController < ApplicationController
layout "login"
def new
	@user = User.new
end
def create
	@user1=User.new(user_params)
	if @user1.save
		session[:user_id] = @user1.id
		redirect_to '/gameview'
	else 
		redirect_to '/signup'
	end
end

def login
	@user1=User.new
end

private 
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
