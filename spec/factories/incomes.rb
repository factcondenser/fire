# frozen_string_literal: true

FactoryBot.define do
  factory :income do
    user
    income_category
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
