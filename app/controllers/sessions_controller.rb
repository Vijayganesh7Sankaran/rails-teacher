class SessionsController < ApplicationController

def new
end
def create
	@user1 = User.find_by_email(params[:session][:email])
	@admin = User.find_by_role("admin")
	if (@user1)
		if ((@user1.email == @admin.email) && @user1.authenticate(params[:session][:password]))
			session[:user_id] = @user1.id
			redirect_to '/admin'
			
		elsif (@user1 && @user1.authenticate(params[:session][:password]))
	    	session[:user_id] = @user1.id
    		redirect_to '/user'
		end
	else	  
		redirect_to '/signup'
	end
end
def destroy
	session[:user_id] = nil
	redirect_to '/signup'
end

end
