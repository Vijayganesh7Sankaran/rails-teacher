class OptionsController < ApplicationController
  before_filter :set_cache_buster, :require_user
  def new
    @option = Option.new
    @question_id = params[:id]
  end

  def create
    @option = Option.new(params.require(:option).permit(:option,:correct))
    @option_id = @Option.id
    if @option.save
      @question = Question.find
    end
  end

  def view
  end

  def update
  end

  def destroy
  end
end
