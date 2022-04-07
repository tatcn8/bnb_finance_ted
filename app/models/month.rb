class Month < ApplicationRecord
    include Visible
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_one_attached :cover_picture

    validates :month, presence: true, length: { minimum: 3 }


    def sum_expense
        self.expenses.map(&:amount).map(&:to_f).sum.to_i
    end

    def sum_income
        self.incomes.map(&:amount).map(&:to_f).sum.to_i
    end

    def sum_income_realized
        sum = 0
        self.incomes.each do |income|
            if income.status == "Realized" 
                sum += income.amount.to_i
            end
        end
        return sum
    end

    def sum_income_expected
        sum = 0
        self.incomes.each do |income|
            if income.status == "Expected" 
                sum += income.amount.to_i
            end
        end
        return sum
    end

    def sum_expense_realized
        sum = 0
        self.expenses.each do |expense|
            if expense.status == "Realized" 
                sum += expense.amount.to_i
            end
        end
        return sum
    end

    def sum_expense_expected
        sum = 0
        self.expenses.each do |expense|
            if expense.status == "Expected" 
                sum += expense.amount.to_i
            end
        end
        return sum
    end


end
