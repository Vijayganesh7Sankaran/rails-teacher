class AttemptController < ApplicationController
    layout 'userHomepage'
    before_filter :set_cache_buster, :require_user
    def index
        @quiz = Quiz.all
       
        @user1 = User.find_by_id(current_user.id)
    end
    
    
    def quizresponse
        @quiz = Quiz.find_by_id(params[:quiz_id])
        @question = @quiz.questions
        @question_id = @quiz.questions.first.id
        @req_question = @quiz.questions.find((@question_id.to_i + (params[:question_id]).to_i))
        @req_options = @req_question.options
        @first_option = @req_options.first.id
        if (@first_option + ((params[:option_id]).to_i)) == @req_options.find_by_correct(true).id
            render plain:'true'
        else
            render plain:'false'
        end
    end
    
    def retrieve1
        
       
        @user1 = User.find_by_id(current_user.id)
        
        @category = params[:category]
        @level = params[:level]
        
        @require_quiz = Quiz.where(:category_name => @category, :level => @level)
        
        @jc = "[ \""
        @j_id = "[ \""
        l=0
        @require_quiz.each do |r|
            #@jc<<r.category_name
            if !(l == (@require_quiz.length)-1)
                @jc<<r.quiz_name+"\" , \""
                @j_id<<r.id.to_s+"\" , \""
            else
                @jc<<r.quiz_name+"\" ]"
                @j_id<<r.id.to_s+"\" ]"
            end
            l+=1
        end 
        
        @my_json = "{ \"quiz_name\":" + @jc + ", \"id\":" + @j_id +" }"
        
        #render :json => @require_quiz.find_by_category_name('Bootstrap')
        render :json => @my_json
        
    end
    
    
    def view
        
       
        @user1 = User.find_by_id(current_user.id)
        
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
    