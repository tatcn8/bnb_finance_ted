class Expense < ApplicationRecord
  include FinanceStatus

  belongs_to :month
end
