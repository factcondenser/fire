# frozen_string_literal: true

SAMPLE_USER_COUNT = 3

SAMPLE_USER_COUNT.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password, confirmed_at: Time.zone.now)
end

puts 'Loaded User samples'
