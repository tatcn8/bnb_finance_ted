class GoalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @goals = current_user.goals

    respond_to do |format|
      format.html
      format.csv{ send_data @goals.to_csv }
    end
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

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])

    if @goal.update(goal_params)
      redirect_to @goal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy

    redirect_to goals_path, status: :see_other
  end
  private
  def goal_params
    params.require(:goal).permit(:title, :initial_value, :goal_value, :years_to_save)
  end
end