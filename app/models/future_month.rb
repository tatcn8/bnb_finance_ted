class FutureMonth < ApplicationRecord
    include Visible
    belongs_to :user
    has_many :expected_expenses, dependent: :destroy
    has_many :expected_incomes, dependent: :destroy

    validates :title, presence: true, length: { minimum: 3 }

    def sum_future_expense
        self.expected_expenses.map(&:amount).map(&:to_f).sum.to_i
    end

    def sum_future_income
        self.expected_incomes.map(&:amount).map(&:to_f).sum.to_i
    end

end
