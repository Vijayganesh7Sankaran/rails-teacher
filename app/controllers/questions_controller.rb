class QuestionsController < ApplicationController
 # respond_to :js, :json, :html
 layout "adminHomepage", :except => [:update, :destroy, :ashidestroy, :show]
 before_filter :set_cache_buster, :require_user
 
 
def index
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @user1 = User.find_by_id(@current_user.id)
  @ques_id = params[:question_id]
end
  
def new
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @user1 = User.find_by_id(@current_user.id)
  @question=Question.new
  @quiz_id = params[:id]
end

def create
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @user1 = User.find_by_id(@current_user.id)
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
end
  


def show
  @quizze= Quiz.find_by_id(params[:quiz_id])
  @quest = params[:question]
  @option = params[:option]
  @correct_opt = params[:coption]
  @points = params[:pts]
  @imgurl = params[:imgurl]
  @imgdesc = params[:imgdesc]
  print @correct_opt
  print @points
  i=0
  j=1
  @quest.each do |equestion|
    if @imgurl && @imgdesc
      @question = Question.new(:question => equestion,:point => @points[j],:imgurl => @imgurl[j], :imgdesc => @imgdesc[j])
    else
      @question = Question.new(:question => equestion,:point => @points[j])
    end
    if @question.save
      @quizze.questions << @question
      k=1
      @option[i.to_s].each do |t|
        if @correct_opt[j] == k.to_s
          print "yes"
         @opt = Option.create(:option => t, :correct => true)
        else
           @opt = Option.create(:option => t, :correct => false)
        end
        @question.options << @opt
       k+=1
      end
      i+=1 
    end
   j+=1 
  end
end

def update
  
  @quizze= Quiz.find_by_id(params[:quiz_id])
  @quest = params[:question]
  @option = params[:option]
  @correct_opt = params[:coption]
  @points = params[:pts]
  i=0
  j=0
  
  @questions = @quizze.questions
  print @questions.length.to_s+"  "+@quest.length.to_s
  if  (@quest.length - @questions.length) < 1 
    print 'in the if '
      @questions.each do |t|
        t.update_attribute(:question,@quest[i])
        t.update_attribute(:point,@points[j])
        
        @options= Option.where(:question_id => t.id)
        k = 1
        l = 0
        @option[i.to_s].each do |o|
            if l < @options.length
                #print j
                  if @correct_opt[j] == k.to_s
                    print "yes1"
                    @options[l].update_attribute(:option, o)
                    @options[l].update_attribute(:correct, true)
                  else
                    @options[l].update_attribute(:option,o)
                     @options[l].update_attribute(:correct, false)
                  end
                 l+=1
           else
            if @correct_opt[j] == k.to_s
              #print "yes"
              @tmp = Option.create(:option => o, :correct => true)
              question.find(t.id).options << @tmp
            else
             @tmp =  Option.create(:option => o, :correct => false)
             Question.find(t.id).options << @tmp
            end  
        end
        k+=1
    end
    j+=1
    i+=1
    
  end
  else
    myl = @questions.length
    print " "+@questions.length.to_s+" "+@quest.length.to_s
    while (@quest.length-myl) != 0 do 
      print 'in the loop1'
       @question = Question.new(:question => @quest[myl1+1],:point => @points[myl+1])
       if @question.save
          @quizze.questions << @question
          k=1
          @option[(myl+1).to_s].each do |t|
            if @correct_opt[myl+1] == k.to_s
               print "yes"
              @opt = Option.create(:option => t, :correct => true)
            else
               @opt = Option.create(:option => t, :correct => false)
            end
          @question.options << @opt
          k+=1
        end
      end
      myl+=1  
    end
    #render plain:'in the loop'
    
  end
   
end

def destroy
  
end
  
def ashidestroy
  @quiz = Quiz.find_by_id(params[:quiz_id])
  @question = @quiz.questions
  @question.each do |t|
    Option.where(:question_id => t.id).destroy_all
  end
  @quiz.questions.destroy_all
  @quiz.destroy
end
end