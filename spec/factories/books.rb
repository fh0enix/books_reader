FactoryBot.define do
  factory :book do
    title { "#{Faker::Book.title} - #{Faker::Number.number(digits: 4)}" }
    author { Faker::Book.author }
    isbn { Faker::Number.decimal_part(digits: 13) }
    description { Faker::Lorem.paragraph }

    trait :with_content do
      transient do
        content_path { Rails.root.join("spec", "test_files", "test.pdf") }
      end

      after(:build) do |book, evaluator|
        if book.persisted?
          book.pdf.attach(io: File.open(evaluator.content_path),
                          filename: "test.pdf",
                          content_type: "application/pdf")
        end
      end
    end
  end
end
