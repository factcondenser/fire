# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
EXPENSE_CATEGORIES = {
  "Business" => [],
  "Charity" => [],
  "Comms" => %w[Internet Phone],
  "Education" => %w[Books Online\ Materials],
  "Entertainment" => [],
  "Family" => [],
  "Fitness" => [],
  "Food" => %w[Groceries Restaurant],
  "Friends" => [],
  "Housing" => %w[Mortgage Rent],
  "Insurance" => %w[Dental Health Life Renter's Vision],
  "Supplies" => %w[Clothing Furniture Grooming Kitchen Maintenance Office Toiletries],
  "Taxes" => %w[FICA Federal\ Witholding State\ Witholding],
  "Transport" => %w[Bike Bus Rideshare],
  "Utitlies" => %w[Electric Gas Laundry Water],
  "Uncategorized" => []
}.freeze

# Create seed users.
user = User.find_or_initialize_by(email: "user@example.com")
user.password = "password"
user.confirmed_at = Time.zone.now
user.save

user = User.find_or_initialize_by(email: "user2@example.com")
user.password = "password2"
user.confirmed_at = Time.zone.now
user.save

puts "Loaded User seeds"

# Create seed categories.
EXPENSE_CATEGORIES.each do |category_name, subcategory_names|
  category = ExpenseCategory.find_or_create_by(name: category_name, parent: nil)
  subcategory_names.each do |subcategory_name|
    ExpenseCategory.find_or_create_by(name: subcategory_name, parent: category)
  end
end

puts "Loaded ExpenseCategory seeds"
