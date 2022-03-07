class Income < ApplicationRecord
  include Visible
  
  belongs_to :month
end
