class Book < ApplicationRecord
    validates :title, :description, :isbn, :description, :author, presence: true
    validates :title, :description, :isbn, :description, uniqueness: true
    validates :isbn, length: { in: 9..10 }
    validates :isbn, numericality: { only_integer: true }

end
