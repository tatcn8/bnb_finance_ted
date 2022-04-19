# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

[
  {email: "nathan@brandnewbox.com"},
  {email: "matt@brandnewbox.com"},
  {email: "will@brandnewbox.com"},
  {email: "josh@brandnewbox.com"},
  {email: "isaac@brandnewbox.com"},
  {email: "ashley@brandnewbox.com"},
  {email: "admin@brandnewbox.com"},
  {email: "youremail@mail.com"}
].each do |user|
  new_user = User.find_or_initialize_by(email: user[:email])
  if new_user.new_record?
    new_user.password = "password"
    new_user.update!(user)
  end
end


User.all.each do |user|
  [
    {title: "College Savings", initial_value: 2000, goal_value: 25000, years_to_save: 15},
    {title: "Boat", initial_value: 2000, goal_value: 7500, years_to_save: 3},
    {title: "House", initial_value: 20000, goal_value: 500000, years_to_save: 5}
  ].each do |goal|
      Goal.find_or_create_by!(title: goal[:title], initial_value: goal[:initial_value], goal_value: goal[:goal_value], years_to_save: goal[:years_to_save], user: user)
  end
end

