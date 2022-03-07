class FutureMonthsController < ApplicationController
  def index
    @future_months = FutureMonth.all
  end

  def show
    @future_month = FutureMonth.find(params[:id])
  end

  def new
    @future_month = FutureMonth.new
  end

  def create
    @future_month = FutureMonth.new(future_month_params)

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
  private
  def future_month_params
    params.require(:future_month).permit(:title, :status)
  end
end