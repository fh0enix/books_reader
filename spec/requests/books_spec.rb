require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:valid_book_attributes) { attributes_for(:book) }
  let(:invalid_book_attributes) { attributes_for(:book, title: nil) }
  let(:new_attributes) { attributes_for(:book, title: "New Title") }
  let!(:book) { create(:book) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @books" do
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end

    it "assigns @book" do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new book as @book" do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET #edit" do
    it "returns a successful response" do
      get :edit, params: { id: book.id }
      expect(response).to be_successful
    end

    it "assigns the requested book as @book" do
      get :edit, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new book" do
        expect do
          post :create, params: { book: valid_book_attributes }
        end.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: { book: valid_book_attributes }
        expect(response).to redirect_to(book_path(Book.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new book" do
        expect do
          post :create, params: { book: invalid_book_attributes }
        end.to_not change(Book, :count)
      end

      it "renders the new template" do
        post :create, params: { book: invalid_book_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the requested book" do
        patch :update, params: { id: book.id, book: new_attributes }
        book.reload
        expect(book.title).to eq("New Title")
      end

      it "redirects to the book" do
        patch :update, params: { id: book.id, book: new_attributes }
        expect(response).to redirect_to(book_path(book))
      end
    end

    context "with invalid parameters" do
      it "does not update the requested book" do
        patch :update, params: { id: book.id, book: invalid_book_attributes }
        book.reload
        expect(book.title).not_to be_nil
      end

      it "renders the edit template" do
        patch :update, params: { id: book.id, book: invalid_book_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      expect do
        delete :destroy, params: { id: book.id }
      end.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to(books_path)
    end
  end
end
