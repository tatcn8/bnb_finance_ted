require "rails_helper"


RSpec.describe Income, type: :model do
  it "has an amount" do
  income = create(:income)
    expect(income.amount).not_to eq nil
  end
end