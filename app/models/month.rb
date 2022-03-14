class Month < ApplicationRecord
    include Visible
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy

    validates :title, presence: true, length: { minimum: 3 }


    def sum_expense
        self.expenses.map(&:amount).map(&:to_f).sum.to_i
    end

    def sum_income
        self.incomes.map(&:amount).map(&:to_f).sum.to_i
    end
end
