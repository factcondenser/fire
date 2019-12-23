FactoryBot.define do
  factory :income do
    income_category
    amount { Faker::Number.decimal(l_digits: 2) }
  end
end
