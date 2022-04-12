class Month < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_one_attached :cover_picture

    validates :month, presence: true
    ARR = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]

    def name
        ARR[month-1]
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

