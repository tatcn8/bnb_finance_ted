class ExpectedIncome < ApplicationRecord
  include Visible
  
  belongs_to :future_month
end
