class AttemptController < ApplicationController
    layout 'userHomepage'
    before_filter :set_cache_buster, :require_user
    def index
        @quiz = Quiz.all
       
        @user1 = User.find_by_id(current_user.id)
    end
    
    def submitresponse
        @myid = current_user.id
        @find = Profile.find_by_user_id(@myid)
        
        #update attempt quiz
        if  @find
            @aq = @find.attempt_quiz
            if @aq.to_i.zero?
                @find.update_attributes(:attempt_quiz => 1)
            else
                @aq = @aq+1
                @find.update_attributes(:attempt_quiz => @aq)
                
            end
        end
        
        #insert into badges table
        
        if @find
            @points = @find.tot_points
            if  @points <= 100 
                @ubadge = Ubadge.find_by_badge_name('Beginner')
                @badge_check = Badge.where(:user_id => @find.user_id, :ubadge_id => @ubadge.id).size
                if @badge_check == 0
                Badge.create(:ubadge_id =>@ubadge.id,:user_id => @find.user_id)
                @@badge_beg = @ubadge.url
                end
            elsif @points > 100 && @points <= 200
            
             @ubadge = Ubadge.find_by_badge_name('Average')
                @badge_check = Badge.where(:user_id => @find.user_id, :ubadge_id => @ubadge.id).size
                if @badge_check == 0
                Badge.create(:ubadge_id =>@ubadge.id,:user_id => @find.user_id)
                 @@badge_beg = @ubadge.url
                end
            elsif @points > 200
                @ubadge = Ubadge.find_by_badge_name('Genius')
                @badge_check = Badge.where(:user_id => @find.user_id, :ubadge_id => @ubadge.id).size
                if @badge_check == 0
                Badge.create(:ubadge_id =>@ubadge.id,:user_id => @find.user_id)
                 @@badge_beg = @ubadge.url
                end
            end
        end
                
        
        #badge retrieval
        
        if current_user
             @badge = Badge.where(:user_id => current_user.id)
            @badge.each do |t|
                
                
            end
        end
        #redirect_to '/games'
        render :layout => false
    end
    
    
    def quizresponse
        @quiz = Quiz.find_by_id(params[:quiz_id])
        @question = @quiz.questions
        @question_id = @quiz.questions.first.id
        @req_question = @quiz.questions.find((@question_id.to_i + (params[:question_id]).to_i))
        @req_options = @req_question.options
        @first_option = @req_options.first.id
        if (@first_option + ((params[:option_id]).to_i)) == @req_options.find_by_correct(true).id
            @myid = current_user.id
            @pts = 2
            @cans =1
            @find = Profile.find_by_user_id(@myid)
            if  @find
                @tpts = @find.tot_points
                @tpts = @pts + @tpts
                @tcans = @find.correct_ans
                if @tcans != nil
                    @tcans = @tcans + 1
                else
                    @tcans = 1
                end
                @find.update_attributes(:tot_points => @tpts, :correct_ans => @tcans)
            else
                Profile.create(:user_id => @myid, :tot_points => @pts, :correct_ans => @cans)
            end
            render plain:'true'
        else
            @myid = current_user.id
            @pts = 2
            @wans =1
            @find = Profile.find_by_user_id(@myid)
            if @find
                @tpts = @find.tot_points
                @tpts = @pts + @tpts
                @twans = @find.wrong_ans
                if @twans != nil
                    @twans = @twans + @wans
                else
                    @twans = 1
                end
                @find.update_attributes(:tot_points => @tpts, :wrong_ans => @twans)
            else
                Profile.create(:user_id => @myid, :tot_points => @pts, :wrong_ans => @wans)
            end
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
    