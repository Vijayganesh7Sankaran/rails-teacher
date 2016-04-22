class QuizzesController < ApplicationController

  layout "adminHomepage"
  before_filter :set_cache_buster, :require_user_admin, :except => [:user, :games, :retrieve_category, :retrieve_quiz]
  before_filter :set_cache_buster, :require_user_user, :except => [:admin, :games, :index, :new, :create, :retrieve_category, :retrieve_quiz]
  before_filter :set_cache_buster, :require_user

 
  
  
  
  
  
  def admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
  end
  
  def user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
   
    
    render layout: "userHomepage"
   
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
    @categories = Category.all.order(:category_name)
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user1 = User.find_by_id(@current_user.id)
    @admin = Quiz.new(params.require(:quiz).permit(:quiz_name,:level,:duration))
    if @admin.save
       @admin_id = @admin.id
       @cat_id = params.require(:quiz).permit(:category_id)
       @category = Category.find(@cat_id['category_id'].to_i)
       @category.quizzes << @admin 
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
    @user1 = User.find_by_id(current_user.id)
    if @user1.role == "admin"
      render layout: "adminHomepage"
    else
      render layout: "userHomepage"
    end
  end
  
  def retrieve_category
    @level = params[:level]
    @my_quiz = Quiz.where(:level =>@level)
    @my_json = "{ \"category\": [ "
    l=0
    @my_quiz.each do |m|
      @my_category = Category.find(m.category_id)
      if(!(l == (@my_quiz.length-1)))
        @my_json<<"\""<<@my_category.category_name+"\", "
      else
        @my_json<<"\""<<@my_category.category_name<<"\""
      end
      l+=1
    end
    
    @my_json<<" ] }"
    
    render json: @my_json
    
  end
  
  def retrieve_quiz
    @category = params[:category]
    @cat = Category.find_by_category_name( @category)
    @m_quiz = Quiz.where(:category_id => @cat.id)
    
    @my_json = "{ \"quiz_name\": [ "
    l=0
    @m_quiz.each do |m|
      if(!(l == (@m_quiz.length-1)))
        @my_json<<"\""<<m.quiz_name+"\""+", "
      else
        @my_json<<"\""<<m.quiz_name<<"\""
      end
      l+=1
    end
    
    @my_json<<" ] }"
    
    render json: @my_json
  end
  
end