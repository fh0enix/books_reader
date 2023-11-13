require "rails_helper"

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:isbn) }
  it { is_expected.to validate_numericality_of(:isbn).only_integer }
  it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }

  it 'has content' do
    book = FactoryBot.create(:book, :with_content)
    expect(book.pdf).to be_attached
  end
end
