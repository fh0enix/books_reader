class Book < ApplicationRecord
    validates :title, :isbn, :description, :author, presence: true
    validates :title, :isbn, :description, uniqueness: true
    validates :isbn, numericality: { only_integer: true, equal_to: 13 }
end
