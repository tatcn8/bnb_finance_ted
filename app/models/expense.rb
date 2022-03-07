class Expense < ApplicationRecord
  include Visible

  belongs_to :month
end
