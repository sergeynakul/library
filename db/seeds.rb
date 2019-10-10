# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: '123456789', password_confirmation: '123456789')
  first_group = Group.create!(name: 'Comedy')
  second_group = Group.create!(name: 'Fantasy')
  first_book = Book.create!(title: 'First comedy book', group_id: first_group.id)
  second_book = Book.create!(title: 'Second comedy book', group_id: first_group.id)
  third_book = Book.create!(title: 'First fantasy book', group_id: second_group.id)
  first_author = Author.create!(name: 'First author')
  second_author = Author.create!(name: 'Second author')
  first_author.books << first_book
  first_author.books << second_book
  second_author.books << third_book
end
