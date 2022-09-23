module BooksHelper
  def current_user_copy(book)
    Copy.where(Borrower: current_user.email, book_id: book.id).take
  end
end
