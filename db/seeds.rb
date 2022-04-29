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

15.times{
  Month.all.each do |month|
    [
      {title: Faker::Company.name, earner: Faker::Name.name, amount: Faker::Number.number(digits: 3)}
    ].each do |income|
      Income.find_or_create_by!(title: income[:title], earner: income[:earner], amount: income[:amount], month: month, status: "Expected")
      Income.find_or_create_by!(title: income[:title], earner: income[:earner], amount: income[:amount], month: month, status: "Realized")
    end
  end
}

15.times{
  Month.all.each do |month|
    [
      {title: Faker::Restaurant.name, amount: Faker::Number.number(digits: 3)}
    ].each do |expense|
      Expense.find_or_create_by!(title: expense[:title], amount: expense[:amount], month: month, status: "Expected")
      Expense.find_or_create_by!(title: expense[:title], amount: expense[:amount], month: month, status: "Realized")
    end
  end
}
