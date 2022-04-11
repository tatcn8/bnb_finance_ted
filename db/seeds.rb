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
    {month: "Jan", year: "2021"},
    {month: "Feb", year: "2021"},
    {month: "Mar", year: "2021"},
    {month: "Apr", year: "2021"},
    {month: "May", year: "2021"},
    {month: "Jun", year: "2021"},
    {month: "Jul", year: "2021"},
    {month: "Aug", year: "2021"},
    {month: "Sep", year: "2021"},
    {month: "Oct", year: "2021"},
    {month: "Nov", year: "2021"},
    {month: "Dec", year: "2022"},
    {month: "Jan", year: "2022"},
    {month: "Feb", year: "2022"},
    {month: "Mar", year: "2022"},
    {month: "Apr", year: "2022"},
    {month: "May", year: "2022"},
    {month: "Jun", year: "2022"},
    {month: "Jul", year: "2022"},
    {month: "Aug", year: "2022"},
    {month: "Sep", year: "2022"},
    {month: "Oct", year: "2022"},
    {month: "Nov", year: "2022"},
    {month: "Dec", year: "2022"}
  ].each do |month|
      Month.find_or_create_by!(month: month[:month], year: month[:year], user: user)
  end
end


5.times{
  Month.all.each do |month|
    [
      {title: Faker::Restaurant.name, amount: Faker::Number.number(digits: 3)}
    ].each do |expense|
      Expense.find_or_create_by!(title: expense[:title], amount: expense[:amount], month: month, status: "Expected")
    end
  end
}


5.times{
  Month.all.each do |month|
    [
      {title: Faker::Company.name, earner: Faker::Name.name, amount: Faker::Number.number(digits: 3)}
    ].each do |income|
      Income.find_or_create_by!(title: income[:title], earner: income[:earner], amount: income[:amount], month: month, status: "Expected")
    end
  end
}

