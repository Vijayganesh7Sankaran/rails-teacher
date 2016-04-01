class GameController < ApplicationController
layout "dashboard"
before_filter :set_cache_buster, :require_user
  def view
  end
end
