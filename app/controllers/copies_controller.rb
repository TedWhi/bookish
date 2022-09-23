class CopiesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.create(copy_params)
    redirect_to "/books/#{@book.id}"
  end

  def edit
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])

    if @copy.update(copy_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    @copy.destroy
    redirect_to book_path(@book), status: :see_other
  end

  private
    def copy_params
      params.require(:copy).permit(:Borrower, :DueDate)
    end
end
