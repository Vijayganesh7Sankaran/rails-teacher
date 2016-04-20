class AttemptController < ApplicationController
    layout 'userHomepage'
    def index
        @quiz = Quiz.all
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        @user1 = User.find_by_id(@current_user.id)
    end
    
    def retrieve1
        
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        @user1 = User.find_by_id(@current_user.id)
        
        @category = params[:category]
        @level = params[:level]
        
        @require_quiz = Quiz.where(:category_name => @category, :level => @level)
        namestr = String.new
        @require_quiz.each do |f|
            namestr<<f.id.to_s+' '+f.quiz_name+' '
        end
        render plain:namestr
        
    end
    
    
    def view
        
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        @user1 = User.find_by_id(@current_user.id)
        
        @quiz = Quiz.find_by_id(params[:id])
        
        @question = @quiz.questions
        
        @hash = Hash.new{|h, k| h[k] = []}
        @radio = Hash.new{|h, k| h[k] = []}
        
        @question.each do |t|
             #print t.id
             options = Option.where(:question_id => t.id)
             i=0
             options.each do |f|
                  @hash[t.id][i] = f.option
                  @radio[t.id][i] = f.correct
                  i+=1
             end
        end
        
        #render plain:@quiz.quiz_name
        
    end
end
    