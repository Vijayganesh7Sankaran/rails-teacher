class GameController < ApplicationController
layout "dashboard"
before_filter :set_cache_buster, :require_user
  def view
  end
  
  def admin
    render :layout => 'admin'
    @admin = Quiz.new
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
  
  
  def thechaostone
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		if @user1.role == "admin"
			render :layout => 'adminHomepage'
		else
			render :layout => 'userHomepage'
		end
	end 
		
	def quotegamer
	   @current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		# if @user1.role == "admin"
		# 	render :layout => 'adminHomepage'
		# else
		# 	render :layout => 'userHomepage'
		# end
		
			@quiz = Quiz.find_by_id(params[:id])
		
        
     @question = @quiz.questions
    
     @hash = Hash.new{|h, k| h[k] = []}
     @radio = Hash.new{|h, k| h[k] = []}
    
     @question.each do |t|
         print t.id
        options = Option.where(:question_id => t.id)
        i=0
        options.each do |f|
              @hash[t.id][i] = f.option
              @radio[t.id][i] = f.correct
              i+=1
        end     
    end
   	render :layout => 'userHomepage'
		
		
		
	end
	
	
	def jigsawtron
	    
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		
		@quizze = Quiz.find_by_id(params[:id])
		
			@quiz = Quiz.find_by_id(params[:id])
		
			#print @quiz.id
        
             @question = @quiz.questions
            
             @hash = Hash.new{|h, k| h[k] = []}
             @radio = Hash.new{|h, k| h[k] = []}
            
             @question.each do |t|
                 print t.id
                options = Option.where(:question_id => t.id)
                i=0
                options.each do |f|
                      @hash[t.id][i] = f.option
                      @radio[t.id][i] = f.correct
                      i+=1
                end     
             end
		
		
		if @user1.role == "admin"
			render :layout => 'adminHomepage'
		else
			render :layout => 'userHomepage'
		end
		
		
	end
	
	def chaostone
	end
	
	def getstone
	    
	    @quizze = Quiz.find_by_id(params[:id])
		
		@quiz = Quiz.find_by_id(params[:id])
	    
	     @ch_json = "["
	     
	     @question = @quiz.questions
    
         @hash = Hash.new{|h, k| h[k] = []}
         @radio = Hash.new{|h, k| h[k] = []}
         l = 0
         @question.each do |t|
             
             @ch_json<<"{ \"quizid\":"<<"\""<<params[:id]<<"\""<<", \"questionid\":"<<"\""<<t.id.to_s<<"\", \"question\":"<<"\""<<t.question.gsub('"', '\"')<<"\", \"option\": ["
             
             print t.id
            options = Option.where(:question_id => t.id)
            i=0
            correct_option = nil
            options.each do |f|
                  @hash[t.id][i] = f.option
                  @radio[t.id][i] = f.correct
                  if f.correct == true
                    correct_option = (i+1)
                  end
                  if i < (options.length-1)
                    @ch_json<<"\""<<f.option.to_s.gsub('"', '\"')<<"\","
                  else
                    @ch_json<<"\""<<f.option.to_s.gsub('"', '\"')<<"\""
                  end
                  i+=1
            end 
            
            if l < (@question.length-1)
                @ch_json<<"], \"points\":"<<"\""<<t.point.to_s<<"\","<<"\"correct\":"<<"\""<<correct_option.to_s<<"\" }"
            else
                @ch_json<<"], \"points\":"<<"\""<<t.point.to_s<<"\","<<"\"correct\":"<<"\""<<correct_option.to_s<<"\" }"
            end
            l+=1
        end
        @ch_json<<"]"
        
        render plain: @ch_json
	end
	
	def setstone
	end
	
	
	def captainplanet
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
		@user1 = User.find_by_id(@current_user.id)
		# if @user1.role == "admin"
		# 	render :layout => 'adminHomepage'
		# else
		# 
		# end
		
		@quiz = Quiz.find_by_id(params[:id])
		
			#print @quiz.id
        
     @question = @quiz.questions
    
     @hash = Hash.new{|h, k| h[k] = []}
     @radio = Hash.new{|h, k| h[k] = []}
    
     @question.each do |t|
         print t.id
        options = Option.where(:question_id => t.id)
        i=0
        options.each do |f|
              @hash[t.id][i] = f.option
              @radio[t.id][i] = f.correct
              i+=1
        end     
    end
   	render :layout => 'userHomepage'
		
		
	end
end
