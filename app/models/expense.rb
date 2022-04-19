class Expense < ApplicationRecord
  include FinanceStatus

  belongs_to :month
  def self.total
    all.map(&:amount).sum
  end
end
