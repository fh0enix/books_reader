class Book < ApplicationRecord
  validates :title, :isbn, :author, presence: true
  validates :title, :isbn, :description, uniqueness: { case_sensitive: false }
  validates :isbn, numericality: { only_integer: true }
  validates :isbn, length: { is: 13 }

  scope :ordered, -> { order(title: :asc) }
end
