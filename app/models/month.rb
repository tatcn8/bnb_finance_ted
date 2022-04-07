class Month < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy

    validates :month, presence: true, length: { minimum: 3 }


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
        items.select{ |item| item.status == status }.map(&:amount).map(&:to_i).sum
    end
end

