class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:index, :destroy, :show, :update, :create, :new]
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	# before_action :validate_user, only: [:show, :edit, :update, :destroy]

	def show
		@books = Book.find(params[:id])
		@book = Book.new
		# @user = User.find(params[:id])
		@user = @books.user
	end

	def index
		@books = Book.all
		@book = Book.new
    	@user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			@user = current_user
			flash[:notice] = "error"
			render :index
			# render :index, alert: "error"
		end
	end

	def new
		@book = Book.new
	end

	def update
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated."
			redirect_to @book
		else
			# render :edit, alert: "error"
	        @alert = "error"
	        render :edit
		end
	end

	def destroy
		if @book.destroy
			flash[:notice] = "successfully destroy"
			redirect_to root_path
		else
			# redirect_to root_path, alert: "error"
			@alert = "error"
	        render :root
		end
	end

	private
	def find_book
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
     book = Book.find(params[:id])
     # belong_toのおかげでbookブジェクトからuserオブジェクトへアクセスできる。
     if current_user.id != book.user.id
       redirect_to root_path
     end
    end

end
