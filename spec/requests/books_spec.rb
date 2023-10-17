# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { { title: '' } }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        expect do
          post books_url, params: valid_attributes
        end.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post books_url, params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it 'renders a response with 422 status (i.e., to display the "new" template)' do
        post books_url, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let(:book) { create(:book) }
    let(:new_attributes) { attributes_for(:book) }

    context 'with valid parameters' do
      it 'updates the requested book' do
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.title).to eq(new_attributes[:title])
      end

      it 'redirects to the book' do
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context 'with invalid parameters' do
      it 'renders a response with 422 status (i.e., to display the "edit" template)' do
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:be_unprocessable)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:book) { create(:book) }

    it 'destroys the requested book' do
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      delete book_url(book)

      expect(response).to redirect_to(books_url)
    end
  end
end
