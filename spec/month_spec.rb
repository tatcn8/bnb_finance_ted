require "rails_helper"


RSpec.describe Month, type: :model do
  it "has a month and a year" do
    month = create(:month)
    expect(month.month).not_to eq nil
  end
end