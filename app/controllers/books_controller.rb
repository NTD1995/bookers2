class BooksController < ApplicationController
  def new
    @book = Book.new
  end

    def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      redirect_to books_path
    else
    @user = User.find(current_user.id)
    @books = Book.all
      render :index
    end
  end
  

  def destroy
    book = Book.find(params[:id])  
    book.destroy 
    redirect_to '/books' 
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.page(params[:page])
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
     @user = @book.user
  end

  def edit
      @book = Book.find(params[:id])

  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)  
    else
      render :edit
    end
  end


    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

    def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
