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
    @book = Book.create(book_params)

    if @book.save
      flash[:notice] = "Book was successfully created."

      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resourse

    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."

      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resourse.destroy

    flash[:alert] = "Book was successfully deleted."

    redirect_to books_path
  end

  private

    def collection
      Book.ordered
    end

    def resourse
      collection.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description)
    end
end
