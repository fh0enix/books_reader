class BooksIndex < Chewy::Index
  index_scope Book
  field :author
  field :title
  field :isbn
end
