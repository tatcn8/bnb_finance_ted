class GoalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @goals = Goal.all
  end
  
  def show
    @goal = Goal.find(params[:id])
  end


  private
  def goal_params
    params.require(:title).permit(:initial_value, :goal_value, :years_to_save)
  end
end