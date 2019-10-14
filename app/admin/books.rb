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

  sidebar 'Add author in this Book', only: :show do
    render 'add_author', book: book
  end

  member_action :add_author, method: :put do
    book = Book.find(params[:id])
    author = Author.find(params[:author_id])
    book.authors << author
    redirect_to admin_book_path(book), notice: 'Author added in book!'
  end

  form partial: 'form'

  show do
    attributes_table do
      row :title
      row :picture do |ad|
        image_tag url_for(ad.picture)
      end
    end
  end
end
