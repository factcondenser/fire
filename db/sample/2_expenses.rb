# frozen_string_literal: true

SAMPLE_EXPENSE_COUNT = 50

num_users = User.count
num_categories = ExpenseCategory.count

SAMPLE_EXPENSE_COUNT.times do
  random_user_offset = rand(num_users)
  random_user_id = User.offset(random_user_offset).pick(:id)
  random_category_offset = rand(num_categories)
  random_category_id = ExpenseCategory.offset(random_category_offset).pick(:id)

  Expense.create(
    user_id: random_user_id,
    expense_category_id: random_category_id,
    amount: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.sentence
  )
end

puts "Loaded Expense samples"
