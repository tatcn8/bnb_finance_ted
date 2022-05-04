FactoryBot.define do
  factory :user do
      email { "youremail@youremail.com" }
      password { "password" }
      admin { false }
  end
end