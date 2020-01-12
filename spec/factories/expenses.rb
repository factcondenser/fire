# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    user
    expense_category
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
