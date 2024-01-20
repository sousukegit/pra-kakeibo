class BooksController < ApplicationController
    def index
        @books = Book.all      
    end

    def show
        @books = Book.find(params[:id])     
    end

    def book_params
        params.require(:).permit(:)
    end

end
