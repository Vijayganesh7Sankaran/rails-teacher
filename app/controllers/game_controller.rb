class GameController < ApplicationController
layout "dashboard"
before_filter :set_cache_buster, :require_user
  def view
  end
  def admin
    render :layout => 'admin'
    @admin = Quiz.new
  end
end
