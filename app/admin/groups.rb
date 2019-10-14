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

  sidebar 'Add book in this Group', only: :show do
    render 'add_book', group: group
  end

  member_action :add_book, method: :put do
    group = Group.find(params[:id])
    book = Book.find(params[:book_id])
    group.books << book
    redirect_to admin_group_path(group), notice: 'Book added in group!'
  end
end
