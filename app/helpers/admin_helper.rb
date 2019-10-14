module AdminHelper
  def self.sorted_available_books(group)
    booked_books_ids = group.books.pluck(:id)
    available_book_ids = Book.pluck(:id) - booked_books_ids
    available_books = available_book_ids.map do |book_id|
      book = Book.find(book_id)
      [book.title, book.id]
    end
    available_books.sort { |a, b| a[0] <=> b[0] }
  end

  def self.sorted_available_authors(book)
    booked_authors_ids = book.authors.pluck(:id)
    available_author_ids = Author.pluck(:id) - booked_authors_ids
    available_authors = available_author_ids.map do |author_id|
      author = Author.find(author_id)
      [author.name, author.id]
    end
    available_authors.sort { |a, b| a[0] <=> b[0] }
  end
end
