# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456', role: 'superadmin')
AdminUser.create!(email: 'group@example.com', password: '123456', password_confirmation: '123456', role: 'group')
AdminUser.create!(email: 'book@example.com', password: '123456', password_confirmation: '123456', role: 'book')
AdminUser.create!(email: 'author@example.com', password: '123456', password_confirmation: '123456', role: 'author')

fantasy_book = Group.create!(name: 'Fantasy')
business_book = Group.create!(name: 'Business')

awakening = Book.create!(title: 'Awakening', group: fantasy_book)
awakening.picture.attach(io: File.open(Rails.root.join('db/seeds/pictures/awakening.jpg')), filename: 'awakening.jpg')
girls = Book.create!(title: 'Girls of Paper and Fire', group: fantasy_book)
girls.picture.attach(io: File.open(Rails.root.join('db/seeds/pictures/girls.jpg')), filename: 'girls.jpg')
meeting = Book.create!(title: 'Get the Meeting!', group: business_book)
meeting.picture.attach(io: File.open(Rails.root.join('db/seeds/pictures/meeting.jpg')), filename: 'meeting.jpg')
indistractable = Book.create!(title: 'Indistractable', group: business_book)
indistractable.picture.attach(io: File.open(Rails.root.join('db/seeds/pictures/indistractable.jpg')), filename: 'indistractable.jpg')

awakening.authors << Author.create!(name: 'Lindsey Cowherd')
girls.authors << Author.create!(name: 'James Patterson')
meeting.authors << Author.create!(name: 'Stu Heinecke')
indistractable.authors << Author.create!(name: 'Julie Li')
indistractable.authors << Author.create!(name: 'Nir Eyal')
