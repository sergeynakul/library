ActiveAdmin.register Group do
  permit_params :name

  sidebar 'Books in this Group', only: :show do
    table_for group.books do |t|
      t.column('Title', &:title)
      t.column('') { |book| link_to 'Delete', delete_book_admin_group_path(book), method: :delete, data: { confirm: 'Are you sure?' } }
    end
  end

  member_action :delete_book, method: :delete do
    book = Book.find(params[:id])
    group = book.group
    group.books.delete(book)
    redirect_to admin_group_path(group), notice: 'Book deleted from group!'
  end

  sidebar 'Add books in this Group', only: :show do
    form action: :add_book, method: :post do |f|
      f.select :book_id, Book.all.map { |book| [book.title, book.id] }, prompt: 'Select'
      f.input :submit, type: :submit
    end
  end

  member_action :add_book, method: :post do
    book = Book.find(params[:book_id])
    group = book.group
    group.books << book
    redirect_to admin_group_path(group), notice: 'Book added in group!'
  end
end
