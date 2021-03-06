class BooksController < ApplicationController
  
  def index
    render json: Book.all
  end

  def create
    # some logic to create book
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!

    head :no_content 
  end

  private

  def book_params
    params.require(:book).permit(:title, :auther)
  end
  
end
