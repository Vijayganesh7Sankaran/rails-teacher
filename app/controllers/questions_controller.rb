class QuestionsController < ApplicationController
  layout 'form'
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
  end

  def update
  end

  def destroy
  end
end
