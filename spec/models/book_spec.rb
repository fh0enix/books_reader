# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:description) }
  it { should validate_numericality_of(:isbn).only_integer }
  it { should validate_length_of(:isbn).is_equal_to(13) }

  it 'is valid with valid attributes' do
    book = FactoryBot.build(:book,
                            title: Faker::Book.title,
                            author: Faker::Book.author,
                            isbn: Faker::Number.number(digits: 13).to_s,
                            description: Faker::Lorem.paragraph)
    expect(book).to be_valid
  end
end
