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
  {email: "youremail@mail.com"}
].each do |user|
  new_user = User.find_or_initialize_by(email: user[:email])
  if new_user.new_record?
    new_user.password = "password"
    new_user.update!(user)
  end
end


user_array = User.all.select{ |human| human.id }

for i in user_array do
  [
    {month: "Jan", year: "2021", user_id: i },
    {month: "Feb", year: "2021", user_id: i },
    {month: "Mar", year: "2021", user_id: i },
    {month: "Apr", year: "2021", user_id: i },
    {month: "May", year: "2021", user_id: i },
    {month: "Jun", year: "2021", user_id: i },
    {month: "Jul", year: "2021", user_id: i },
    {month: "Aug", year: "2021", user_id: i },
    {month: "Sep", year: "2021", user_id: i },
    {month: "Oct", year: "2021", user_id: i },
    {month: "Nov", year: "2021", user_id: i },
    {month: "Dec", year: "2022", user_id: i },
    {month: "Jan", year: "2022", user_id: i },
    {month: "Feb", year: "2022", user_id: i },
    {month: "Mar", year: "2022", user_id: i },
    {month: "Apr", year: "2022", user_id: i },
    {month: "May", year: "2022", user_id: i },
    {month: "Jun", year: "2022", user_id: i },
    {month: "Jul", year: "2022", user_id: i },
    {month: "Aug", year: "2022", user_id: i },
    {month: "Sep", year: "2022", user_id: i },
    {month: "Oct", year: "2022", user_id: i },
    {month: "Nov", year: "2022", user_id: i },
    {month: "Dec", year: "2022", user_id: i }
  ].each do |month|
      Month.find_or_create_by!(month: month[:month], year: month[:year], user_id: month[:user_id])
  end
end

