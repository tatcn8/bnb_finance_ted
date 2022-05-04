FactoryBot.define do
    factory :goal do
        initial_value { 75 }
        goal_value { 105 }
        title { "car" }
        years_to_save { 5 }
        user
    end
  end