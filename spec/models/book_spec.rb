require "rails_helper"

RSpec.describe Book, type: :model do
  let(:book) { create(:book, :with_content) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:isbn) }
  it { is_expected.to validate_numericality_of(:isbn).only_integer }
  it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }
  it { is_expected.to have_one_attached(:pdf) }

  it "validates content type of attached file" do
    expect(book.pdf).to be_attached
    expect(book.pdf.content_type).to eq('application/pdf')
  end

  it "validates size of attached file" do
    expect(book.pdf).to be_attached
    expect(book.pdf.byte_size).to be < 20.megabytes
  end
end
