class Goal < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :initial_value, comparison: { less_than: :goal_value }
  validates :initial_value, numericality: { greater_than: 0 }
  validates :goal_value, numericality: { greater_than: 0 }
  validates :years_to_save, numericality: { greater_than: 0 }


  def amount_left_to_save
    goal_value - initial_value
  end

  def amount_per_month
    (goal_value - initial_value)/(years_to_save * 12)
  end


end
