FactoryBot.define do
  factory :book do
    title { "#{Faker::Book.title} - #{Faker::Number.number(digits: 4)}" }
    author { Faker::Book.author }
    isbn { Faker::Number.decimal_part(digits: 13) }
    description { Faker::Lorem.paragraph }

    trait :with_content do
      after(:create) do |book|
        content_path = Rails.root.join("app", "assets", "book_test", "test.pdf")
        book.pdf.attach(io: File.open(content_path),
                        filename: "test.pdf",
                        content_type: "application/pdf")
      end
    end
  end
end
