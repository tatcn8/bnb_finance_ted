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

    def self.options_for_select
      Hash[MONTHS.zip(NUMBERS)].transform_keys { |key| key.to_sym }
    end

    private
    def sum_items(items, status)
        items.select{ |item| item.status == status }.map(&:amount).sum
    end
end
