class Book < ApplicationRecord
  has_one_attached :pdf, dependent: :destroy

  validates :title, :isbn, :author, presence: true
  validates :title, :isbn, uniqueness: { case_sensitive: false }
  validates :isbn, numericality: { only_integer: true }
  validates :isbn, length: { is: 13 }

  validate :pdf_file_size
  validate :pdf_content_type

  scope :ordered, -> { order(:title) }

  def pdf_file_size
    if pdf.attached? && pdf.byte_size > 20.megabytes
      errors.add(:pdf, "file size must be less than 20MB")
    end
  end

  def pdf_content_type
    if pdf.attached? && !pdf.content_type.in?(["application/pdf"])
      errors.add(:pdf, "must be a PDF file")
    end
  end
end
