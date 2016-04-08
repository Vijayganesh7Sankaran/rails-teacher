class SessionsController < ApplicationController

def new
end
def create
	@user = User.find_by_email(params[:session][:email])
	@admin = User.find_by_role("admin")
	if (@user && @user.authenticate(params[:session][:password])) && (@admin)
		session[:user_id] = @user.id
		redirect_to '/admin'
	elsif @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to '/gameview'
	else	  
		redirect_to '/signup'
	end
end
def destroy
	session[:user_id] = nil
	redirect_to '/signup'
end

end
