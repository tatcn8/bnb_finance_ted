class FutureMonthsController < ApplicationController
  before_action :authenticate_user! 
  before_action :correct_user, except: [:new, :index, :create]

  def index
    @future_months = FutureMonth.all
  end

  def show
    @future_month = FutureMonth.find(params[:id])
  end

  def new
    # @future_month = FutureMonth.new
    @future_month = current_user.future_months.build
  end

  def create
    # @future_month = FutureMonth.new(future_month_params)
    @future_month = current_user.future_months.build(future_month_params)

    if @future_month.save
      redirect_to @future_month
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @future_month = FutureMonth.find(params[:id])
  end

  def update
    @future_month = FutureMonth.find(params[:id])

    if @future_month.update(future_month_params)
      redirect_to @future_month
    else
      render :edit, status: :unprocessable_entity
    end
  end
def destroy
    @future_month = FutureMonth.find(params[:id])
    @future_month.destroy

    redirect_to root_path, status: :see_other
  end

def correct_user
  @future_month = current_user.future_months.find_by(id: params[:id])
  redirect_to root_path, notice: "Not allowed to view other users' data" if @future_month.nil?
end

  private
  def future_month_params
    params.require(:future_month).permit(:title, :user_id, :status)
  end
end