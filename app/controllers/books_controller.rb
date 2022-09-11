class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create #保存アクション
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id) #詳細画面へリダイレクト
  end  
  
  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books' #投稿一覧画面へ
  end  
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
