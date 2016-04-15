class QuizzesController < ApplicationController
  
  layout 'homepage'
  def admin
    
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
