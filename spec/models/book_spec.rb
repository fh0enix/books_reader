
require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = FactoryBot.build(:book,
      title: Faker::Book.title,
      author: Faker::Book.author,
      isbn: Faker::Number.number(digits: 13).to_s,
      description: Faker::Lorem.paragraph
    )
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = FactoryBot.build(:book, title: nil)
    expect(book).to_not be_valid
  end

  it "is not valid without an author" do
    book = FactoryBot.build(:book, author: nil)
    expect(book).to_not be_valid
  end

  it "is not valid without a valid ISBN" do
    book = FactoryBot.build(:book, isbn: "invalid_isbn")
    expect(book).to_not be_valid
  end

  it "is not valid without a description" do
    book = FactoryBot.build(:book, description: nil)
    expect(book).to_not be_valid
  end

  it "is not valid if title is not unique" do
    existing_book = FactoryBot.create(:book)
    new_book = FactoryBot.build(:book, title: existing_book.title)
    expect(new_book).to_not be_valid
  end

  it "is not valid if ISBN is not a 13-digit number" do
    book = FactoryBot.build(:book, isbn: "123456789012")
    expect(book).to_not be_valid
  end

  it "is not valid if ISBN is not a number" do
    book = FactoryBot.build(:book, isbn: "invalid_isbn")
    expect(book).to_not be_valid
  end

  it "is not valid if description is not unique" do
    existing_book = FactoryBot.create(:book)
    new_book = FactoryBot.build(:book, description: existing_book.description)
    expect(new_book).to_not be_valid
  end
end
