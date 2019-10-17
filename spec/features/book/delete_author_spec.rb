require 'rails_helper'

feature 'AdminUser can delete author from book', "
  In order delete author from book
  As an authenticated AdminUser
  I'd like to be able to delete author from book
" do
  given(:author) { create(:author) }
  given(:group) { create(:group) }
  given(:admin_user) { create(:admin_user, role: 'book') }
  given(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
  given(:book) { create(:book, picture: picture, group: group) }

  background do
    book.authors << author
    sign_in(admin_user)
    visit admin_book_path(book)
  end

  scenario 'AdminUser tries to delete author from book' do
    expect(page).to have_content author.name

    click_on 'Delete'

    expect(page).to have_content author.name
  end
end
