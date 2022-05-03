require "rails_helper"
require "spec_helper"

RSpec.describe Month, type: :model do
  it "has a year" do
    month = Month.create(month: "Jun", year:Date.today.year)
    expect(month.year).not_to eq nil
    expect(month.month).not_to eq nil
  end
end