require "rails_helper"


RSpec.describe Goal, type: :model do
  it "has an title" do
  goal = create(:goal)
    expect(goal.title).not_to eq nil
    expect(goal.years_to_save).to be > 0
    expect(goal.initial_value).to be < goal.goal_value
  end
end