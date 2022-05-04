FactoryBot.define do
  factory :month do
      month { generate(:month) }
      user
  end
end