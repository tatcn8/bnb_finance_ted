class Income < ApplicationRecord
  include FinanceStatus
  
  belongs_to :month
end
