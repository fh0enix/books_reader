class BookIndex < Chewy::Index
  index_scope Book
  field :author
  field :title
end
