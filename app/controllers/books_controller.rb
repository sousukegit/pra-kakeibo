class BooksController < ApplicationController
    before_action :set_book,only: [:edit,:update,:show,:destroy]

    def index
        #取得
        @books = Book.all 
        #where区で記載
        @books = @books.where(year:params[:year]) if params[:year].present?
        @books = @books.where(month:params[:month]) if params[:month].present?
    end

    def show
 
    end

    def edit

    end

    def update        

        if @book.update(book_params)
            flash[:notice] = "データを一件更新しました"
            redirect_to book_path(@book)
        else
            flash.now[:alert] = "更新失敗"
            render :edit
        end     
    end

    def new
        @book = Book.new
        @book.year = 2024
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            flash[:notice] = "家計簿に"+@book.year.to_s+"年"+ @book.month.to_s+"月"+ @book.category+"を一件登録しました"
            redirect_to books_path
        else
            flash.now[:alert] = "登録に失敗しました"
            render :new
        end
    end

    def destroy
       if @book.destroy
        redirect_to books_path      
       end 
    end

    def set_book
        @book = Book.find(params[:id])
    end

    private

    def book_params
        params.require(:book).permit(:year,:month,:inout,:category,:amount)
    end

end
