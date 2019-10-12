ActiveAdmin.register Book do
  permit_params :title, :picture, :group_id

  sidebar 'Authors of this Book', only: :show do
    table_for book.authors do |t|
      t.column('Name', &:name)
      t.column('') { |author| link_to 'Delete', delete_author_admin_book_path(id: book.id, author_id: author.id), method: :delete, data: { confirm: 'Are you sure?' } }
    end
  end

  member_action :delete_author, method: :delete do
    book = Book.find(params[:id])
    author = Author.find(params[:author_id])
    book.authors.delete(author)
    redirect_to admin_book_path(book), notice: 'Author deleted from book!'
  end
end
