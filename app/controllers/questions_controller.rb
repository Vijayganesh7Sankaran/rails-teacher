class QuestionsController < ApplicationController
 # respond_to :js, :json, :html
  layout 'homepage'
  def index
    @ques_id = params[:question_id]
  end
  def new
    @question=Question.new
    @quiz_id = params[:id]
  end

  def create
    @question=Question.new(params.require(:question).permit(:question,:point))
   
    @id = params[:quiz_id]
    if @question.save
      
      @question_id = @question.id
     quiz=Quiz.find(@id) 
     quiz.questions << @question
     
     print "instance var::"+@question_id.to_s
     redirect_to :action => 'index', :question_id => @question_id
    end
      
  end

  def view
 @quiz = Quiz.find_by_id(params[:id])
 @question = @quiz.questions
 
 @hash = Hash.new{|h, k| h[k] = []}
 
  @question.each do |t|
    #print t.id
    options = Option.where(:question_id => t.id)
    i=0
    options.each do |f|
        @hash[t.id][i] = f.option
         i+=1
    end
   
  end
  end
  


  def ashi
   
    @quizze= Quiz.find_by_id(params[:quiz_id])
    @quest = params[:question]
    @option = params[:option]
    @correct_opt = params[:coption]
    @points = params[:pts]
    print @correct_opt
    print @points
    i=0
    j=1
    @quest.each do |equestion|
      @question = Question.new(:question => equestion,:point => @points[j])
      
      if @question.save
        @quizze.questions << @question
        k=1
        @option[i.to_s].each do |t|
          if @correct_opt[j] == k.to_s
            print "yes"
           @opt = Option.create(:option => t, :correct => true)
          else
             @opt = Option.create(:option => t, :correct => false)
          @question.options << @opt
          end
         k+=1
        end
        i+=1 
      end
     j+=1 
    end
    
    
     
  
  end

  def update
  end

  def destroy
  end
end
