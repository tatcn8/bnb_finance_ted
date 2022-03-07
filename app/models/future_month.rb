class FutureMonth < ApplicationRecord
    include Visible

    has_many :expected_expenses, dependent: :destroy
    has_many :expected_incomes, dependent: :destroy

    validates :title, presence: true, length: { minimum: 3 }
end
