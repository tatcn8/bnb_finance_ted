class FinanceCharts
    def initialize(user, month)
      @user = user
      @month = month
    end
    def total_data
      [
          {
          name: "Expected",
          data: [["Income", @month.incomes.expected.total ], ["Expenses", @month.expenses.expected.total]],
          stack: "Expected"
          },
          {
          name: "Realized",
          data: [["Income", @month.incomes.realized.total], ["Expenses", @month.expenses.realized.total]],
          stack: "Realized"
          }
      ]
  end
  def last_month_comparison
    last_month = @user.months.prior_months_query(@month.year, @month.month).last
    [
      {
        name: "#{last_month.name} #{last_month.year}",
        data: [["Income", last_month.incomes.realized.total], [ "Expenses", last_month.expenses.realized.total]],
        stack: "#{last_month.name} #{last_month.year}"
      },
      {
        name: "#{@month.name} #{@month.year}",
        data: [["Income", @month.incomes.realized.total], ["Expenses", @month.expenses.realized.total]],
        stack: "#{@month.name} #{@month.year}"
      }
    ]
  end
  def income_summary
    month_array = @user.months.prior_months_query(@month.year, @month.month).last(12)
    keys = month_array.map(&:name)
    month_incomes = month_array.map do |month|
      month.incomes.realized.total
    end
    Hash[keys.zip(month_incomes)].transform_keys { |key| key.to_sym }
  end
end
