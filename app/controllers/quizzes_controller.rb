class QuizzesController < ApplicationController

  layout "adminHomepage"
  before_filter :set_cache_buster, :require_user
  
  def admin
    
  end
  
  def user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	
    @user1 = User.find_by_id(@current_user.id)
    render layout: "userHomepage"
    #render plain:@user1.id
  end
  
  def index
    @adm = Quiz.all
  end

  def new
    @admin = Quiz.new
  end

  def create
    @admin = Quiz.new(params.require(:quiz).permit(:quiz_name,:category_name,:level,:duration))
   
    if @admin.save
       @admin_id = @admin.id
      #render plain:'created successfully'
      redirect_to :controller => 'questions',:action => 'new',:id => @admin_id
    end
  end
  
  def show
    
  end
  
  def update
    
  end

  def destroy
    
  end
end
