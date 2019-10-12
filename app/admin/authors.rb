ActiveAdmin.register Author do
  permit_params :name

  sidebar 'Books by this Author', only: :show do
    table_for author.books do |t|
      t.column('Title', &:title)
    end
  end
end
