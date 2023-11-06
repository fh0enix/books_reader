FactoryBot.define do
  factory :book do
    title { "# #{Faker::Number.number(digits: 4)} - #{Faker::Book.title}" }
    author { Faker::Book.author }
    isbn { Faker::Number.decimal_part(digits: 13) }
    description { Faker::Lorem.paragraph }
  end
end
