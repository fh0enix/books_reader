class Book < ApplicationRecord
  has_one_attached :pdf

  validates :title, :isbn, :author, presence: true
  validates :title, :isbn, uniqueness: { case_sensitive: false }
  validates :isbn, numericality: { only_integer: true }
  validates :isbn, length: { is: 13 }

  scope :ordered, -> { order(:title) }
end
