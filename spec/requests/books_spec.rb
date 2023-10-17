# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { { title: '' } }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Book and redirects to the created book' do
        expect do
          post books_url, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)

        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book and renders a response with 422 status' do
        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:book) { create(:book) }
    let(:new_attributes) { attributes_for(:book) }

    context 'with valid parameters' do
      it 'updates the requested book and redirects to the book' do
        expect {
          patch book_url(book), params: { book: new_attributes }
          book.reload
        }.to change { book.title }.to(new_attributes[:title])
         .and change { book.author }.to(new_attributes[:author])

        expect(response).to redirect_to(book_url(book))
      end
    end

    context 'with invalid parameters' do
      it 'renders a response with 422 status' do
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:book) { create(:book) }

    it 'destroys the requested book and redirects to the books list' do
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_url)
    end
  end
end
