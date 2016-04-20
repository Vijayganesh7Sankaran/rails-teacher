class QuizzesController < ApplicationController

  layout "adminHomepage"
  before_filter :set_cache_buster, :require_user
  
  def admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
  
  def user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
    render layout: "userHomepage"
    #render plain:@user1.id
  end
  
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
    @adm = Quiz.all
  end

  def new
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
    @admin = Quiz.new
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
    @admin = Quiz.new(params.require(:quiz).permit(:quiz_name,:category_name,:level,:duration))
   
    if @admin.save
       @admin_id = @admin.id
      #render plain:'created successfully'
      redirect_to :controller => 'questions',:action => 'new',:id => @admin_id
    end
  end
  
  def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
  
  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
  
  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
  
  def games
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
end