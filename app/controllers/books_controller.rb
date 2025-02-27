class BooksController < ApplicationController

      before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

    def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
          flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
    @user = User.find(current_user.id)
    @books = Book.page(params[:page])
         flash.now[:alert] = "Book was make a mistake created."
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
          flash[:notice] = "Book was successfully editingi."
     redirect_to book_path(@book.id)  
    else
           flash.now[:alert] = "Book was make a mistake editing."
      render :edit
    end
  end


    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

    def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
