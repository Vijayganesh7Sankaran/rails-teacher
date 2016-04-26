class BadgesController < ApplicationController
   layout false
  before_filter :set_cache_buster, :require_user
 
  def new 
    @badge = Badge.new
  end
  
  

  def create
    @badge = Badge.new(badge_params)
    if current_user && @badge.save
    
      @user_id = current_user.id
      @user = User.find(@user_id)
      
      @user.badges << @badge
       print "instance var::"+@user.to_s
      
      
    end
  end

  def view
    @leaderboard = Profile.order(tot_points: :desc)
    
    
    
    @user1 = User.find_by_id(current_user.id)
     if @user1.role == "admin"
       render layout: "adminHomepage"
     else
      render layout: "userHomepage"
    end
  end

  def update
  end

  def destroy
  end
  
  def show
  end
  def badge_params
      params.require(:badge).permit(:badge_name)
    end
end
