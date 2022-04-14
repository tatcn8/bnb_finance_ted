class MonthsController < ApplicationController
  before_action :authenticate_user!
  # add a scope last_month and month_array...will take parameters...
  # ..look up scope documentation...inside of month model

  def index
    @months = current_user.months.paginate(page: params[:page], per_page: 10)
  end

  def show
    @month = Month.find(params[:id])
    @last_month = Month.prior_months_query(current_user.id, @month.year, @month.month).last
    @month_array = Month.prior_months_query(current_user.id, @month.year, @month.month).last(12)
    
    @keys = 
      @month_array.map(&:name)
    @month_incomes = 
      @month_array.map do |month|
        month.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum
      end
    @hash = Hash[@keys.zip(@month_incomes)].transform_keys { |key| key.to_sym }

    @realized_income = @month.incomes.realized.total
    @realized_expense = @month.expenses.realized.total
    @expected_income = @month.incomes.expected.total
    @expected_expense = @month.expenses.expected.total
    
    @total_data =[
      {
        name: "Expected",
        data: [["Income", @expected_income], ["Expenses", @expected_expense]],
        stack: "Expected"
      },
      {
        name: "Realized",
        data: [["Income", @realized_income], ["Expenses", @realized_expense]],
        stack: "Realized"
      }
    ]
    if @last_month
      @last_month_comparison = [
        {
          name: "#{@last_month.name} #{@last_month.year}",
          data: [["Income", @last_month.incomes.select { |income| income.status == "Realized" }.map(&:amount).sum], [ "Expenses", @last_month.expenses.select { |expense| expense.status == "Realized" }.map(&:amount).sum]],
          stack: "#{@last_month.name} #{@last_month.year}"
        },
        {
          name: "#{@month.name} #{@month.year}",
          data: [["Income", @realized_income], ["Expenses", @realized_expense]],
          stack: "#{@month.name} #{@month.year}"
        }
      ]
    end
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