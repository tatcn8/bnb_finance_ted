class GoalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @goals = current_user.goals
  end

  def show
    @goal = current_user.goals.find(params[:id]) 
  end

  def new
    @goal = current_user.goals.build
  end

  def create 
    @goal = current_user.goals.build(goal_params)
    
    if @goal.save
      redirect_to @goal
    else 
      render :new, status: :unprocessable_entity
    end
  end
  private
  def goal_params
    params.require(:title).permit(:initial_value, :goal_value, :years_to_save)
  end
end