class BooksController < ApplicationController
  def index
    @books = collection
  end

  def show
    @book = resourse
  end

  def new
    @book = Book.new
  end

  def edit
    @book = resourse
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resourse

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resourse.destroy
    redirect_to books_path, alert: "Book was successfully deleted."
  end

  private

    def collection
      Book.ordered
    end

    def resourse
      collection.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description, :pdf)
    end
end
