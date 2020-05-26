# typed: false
FactoryBot.define do
  factory :user do
    sequence(:username) { |x| "user#{x}" }
    sequence(:email) { |x| "user#{x}@example.test" }
    password { "password" }
    password_confirmation { "password" }
  end
end
