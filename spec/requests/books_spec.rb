require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:valid_book_attributes) { attributes_for(:book) }
  let(:invalid_book_attributes) { attributes_for(:book, title: nil) }
  let(:new_attributes) { attributes_for(:book, title: "New Title") }
  let!(:book) { create(:book) }
  render_views

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @books" do
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "displays a specific book title in the list" do
      get :index

      expect(response.body).to include(book.title)
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

    it "renders the show template" do
      get :show, params: { id: book.id }
      expect(response).to render_template(:show)
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

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
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

    it "renders the edit template" do
      get :edit, params: { id: book.id }
      expect(response).to render_template(:edit)
    end
  end
end
