class MonthsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @months = current_user.months.paginate(page: params[:page], per_page: 10)
  end

  def show
    @month = Month.find(params[:id])
    @last_month = Month.find(@month.id-1)
    @month1 = Month.find(@month.id-2)
    @month2 = Month.find(@month.id-3)
    @month3 = Month.find(@month.id-4)
    @month4 = Month.find(@month.id-5)
    @month5 = Month.find(@month.id-6)
    @month6 = Month.find(@month.id-7)
    @month7 = Month.find(@month.id-8)
    @month8 = Month.find(@month.id-9)
    @month9 = Month.find(@month.id-10)
    @month10 = Month.find(@month.id-11)
    @month11 = Month.find(@month.id-12)
    
    @realized_income = @month.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum
    @realized_expense = @month.expenses.select { |expense| expense.status == "Realized" }.map(&:amount).sum
    @expected_income = @month.incomes.select { |income| income.status == "Expected" }.map(&:amount).sum
    @expected_expense = @month.expenses.select { |expense| expense.status == "Expected" }.map(&:amount).sum
    @total_data = {
      "Projected Income": @expected_income,
      "Realized Income": @realized_income,
      "Projected Expenses": @expected_expense,
      "Realized Expenses": @realized_expense
    }
    @realized_data = { 
      "Realized Income": @realized_income,
      "Realized Expenses": @realized_expense
    }
    @last_month_comparison = {
      "#{@last_month.month} #{@last_month.year} Income": @last_month.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month.month} #{@month.year} Income": @realized_income,
      "#{@last_month.month} #{@last_month.year} Expenses": @last_month.expenses.select { |expense| expense.status == "Realized" }.map(&:amount).sum,
      "#{@month.month} #{@month.year} Expenses": @realized_expense
    }
    @annual_summary ={
      "#{@last_month.month} #{@last_month.year}": @last_month.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month1.month} #{@month1.year}": @month1.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month2.month} #{@month2.year}": @month2.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month3.month} #{@month3.year}": @month3.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month4.month} #{@month4.year}": @month4.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month5.month} #{@month5.year}": @month5.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month6.month} #{@month6.year}": @month6.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month7.month} #{@month7.year}": @month7.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month8.month} #{@month8.year}": @month8.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month9.month} #{@month9.year}": @month9.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month10.month} #{@month10.year}": @month10.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum,
      "#{@month11.month} #{@month11.year}": @month11.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum
    }
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