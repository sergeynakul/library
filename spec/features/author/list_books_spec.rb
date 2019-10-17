require 'rails_helper'

feature 'AdminUser can view list of books', "
  In order view list of author's books
  As an authenticated AdminUser
  I'd like to be able to view books written by the author
" do
  given(:author) { create(:author) }
  given(:group) { create(:group) }
  given(:admin_user) { create(:admin_user, role: 'author') }
  given(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
  given(:books) { create_list(:book, 2, picture: picture, group: group) }

  background do
    author.books << books
    sign_in(admin_user)
    visit admin_author_path(author)
  end

  scenario 'AdminUser can view list of books' do
    expect(page).to have_content books.first.title
    expect(page).to have_content books.last.title
  end
end
