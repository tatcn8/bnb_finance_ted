class MonthsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, except: [:new, :index, :create]

  def index
    @months = Month.all
  end

  def show
    @month = Month.find(params[:id])
  end

  def new
    # @month = Month.new
    @month = current_user.months.build
  end

  def create
    # @month = Month.new(month_params)
    @month = current_user.months.build(month_params)

    if @month.save
      redirect_to @month
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @month = Month.find(params[:id])
  end

  def update
    @month = Month.find(params[:id])

    if @month.update(month_params)
      redirect_to @month
    else
      render :edit, status: :unprocessable_entity
    end
  end
def destroy
    @month = Month.find(params[:id])
    @month.destroy

    redirect_to root_path, status: :see_other
  end

def correct_user
  @month = current_user.months.find_by(id: params[:id])
  redirect_to root_path, notice: "Not allowed to view other users' data" if @month.nil?
end
  private
  def month_params
    params.require(:month).permit(:month, :year, :user_id, :status)
  end
end