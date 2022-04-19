class Month < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_one_attached :cover_picture

    validates :month, presence: true
    MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
    NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    scope :prior_months_query, -> (year, month) { where("((months.year < ?) OR (months.year = ? AND months.month < ?))", year, year, month) }
    
    scope :expected, -> { where(status: "Expected") }

    def name
        MONTHS[month-1]
    end

    def sum_income_realized
        sum_items(incomes, "Realized")
    end

    def sum_income_expected
        sum_items(incomes, "Expected")
    end

    def sum_expense_realized
        sum_items(expenses, "Realized")
    end

    def sum_expense_expected
        sum_items(expenses, "Expected")
    end

    private
    def sum_items(items, status)
        items.select{ |item| item.status == status }.map(&:amount).sum
    end
end

class FinanceCharts
    def initialize(user, month)
      @user = user
      @month = month
    end
    def total_data
      realized_income = @month.incomes.realized.total
      realized_expense = @month.expenses.realized.total
      expected_income = @month.incomes.expected.total
      expected_expense = @month.expenses.expected.total
      [
          {
          name: "Expected",
          data: [["Income", expected_income ], ["Expenses", expected_expense]],
          stack: "Expected"
          },
          {
          name: "Realized",
          data: [["Income", realized_income], ["Expenses", realized_expense]],
          stack: "Realized"
          }
      ]
  end
  def last_month_comparison
    last_month = @user.months.prior_months_query(@month.year, @month.month).last
    realized_income = @month.incomes.realized.total
    realized_expense = @month.expenses.realized.total
    [
      {
        name: "#{last_month.name} #{last_month.year}",
        data: [["Income", last_month.incomes.realized.total], [ "Expenses", last_month.expenses.realized.total]],
        stack: "#{last_month.name} #{last_month.year}"
      },
      {
        name: "#{@month.name} #{@month.year}",
        data: [["Income", realized_income], ["Expenses", realized_expense]],
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


