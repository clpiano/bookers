class BooksController < ApplicationController
  def index
    @books = Book.all #@bookから@booksへ、newからallへ変更
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end  
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  private
  
  def book_params
    params.permit(:title, :body)
  end
end
