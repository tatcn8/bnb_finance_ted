class Goal < ApplicationRecord
  belongs_to :user
  validates :title, presence: true


  def amount_left_to_save
    goal_value - initial_value
  end

  def amount_per_month
    (goal_value - initial_value)/(years_to_save * 12)
  end


end
