# frozen_string_literal: true

COUNT = 50

num_categories = ExpenseCategory.count

COUNT.times do
  random_offset = rand(num_categories)
  random_category_id = ExpenseCategory.offset(random_offset).pick(:id)

  Expense.create(
    expense_category_id: random_category_id,
    amount: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.sentence
  )
end
