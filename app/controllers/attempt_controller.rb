class AttemptController < ApplicationController
    layout 'userHomepage'
    def index
        @quiz = Quiz.all
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def retrieve1
        @category = params[:category]
        @level = params[:level]
        
        @require_quiz = Quiz.where(:category_name => @category, :level => @level)
        idstr = String.new
        namestr = String.new
        i=0
        @require_quiz.each do |f|
            namestr<<f.id.to_s+' '+f.quiz_name+' '
        end
        
        render plain:namestr
        
    end
    
end
