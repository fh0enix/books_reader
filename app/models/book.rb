class Book < ApplicationRecord
    validates :title, :isbn, :description, :author, presence: true
    validates :title, :isbn, :description, uniqueness: true
    validates :isbn, length: { in: 9..10 }
    validates :isbn, numericality: { only_integer: true }
end
