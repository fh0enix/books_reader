require 'faker'

100.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Number.decimal_part(digits: 13),
    description: Faker::Lorem.paragraph
  )
end