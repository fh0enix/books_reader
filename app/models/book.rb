class Book < ApplicationRecord
  update_index('books') { self }

  has_one_attached :pdf, dependent: :destroy

  validates :title, :isbn, :author, presence: true
  validates :title, :isbn, uniqueness: { case_sensitive: false }
  validates :isbn, numericality: { only_integer: true }
  validates :isbn, length: { is: 13 }

  validates :pdf, size: { less_than: 20.megabytes, message: 'file size must be less than 20MB' }
  validates :pdf, content_type: { in: ['application/pdf'], message: 'must be a PDF file' }

  scope :ordered, -> { order(:title) }
end
