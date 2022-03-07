class ExpectedExpense < ApplicationRecord
  include Visible
  
  belongs_to :future_month
end
