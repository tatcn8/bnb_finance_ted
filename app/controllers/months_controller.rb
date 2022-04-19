class MonthsController < ApplicationController
  before_action :authenticate_user!

  
  def index
    @months = current_user.months.paginate(page: params[:page], per_page: 10)
  end

  def show
    @month = current_user.months.find(params[:id])
    @chart = FinanceCharts.new(current_user, @month)
    @last_month = current_user.months.prior_months_query(@month.year, @month.month).last
    @month_array = current_user.months.prior_months_query(@month.year, @month.month).last(12)    
  end

  def new
    # @month = Month.new
    @month = current_user.months.build(year:Date.today.year)
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
    @month = current_user.months.find(params[:id])
  end

  def update
    @month = current_user.months.find(params[:id])

    if @month.update(month_params)
      redirect_to @month
    else
      render :edit, status: :unprocessable_entity
    end
  end
def destroy
    @month = current_user.months.find(params[:id])
    @month.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def month_params
    params.require(:month).permit(:month, :year, :cover_picture, :status)
  end
end