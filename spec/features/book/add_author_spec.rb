require 'rails_helper'

feature 'AdminUser can add author in book', "
  In order add author in book
  As an authenticated AdminUser
  I'd like to be able to add author in book
" do
  given!(:author) { create(:author) }
  given(:group) { create(:group) }
  given(:admin_user) { create(:admin_user, role: 'book') }
  given(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
  given(:book) { create(:book, picture: picture, group: group) }

  background do
    sign_in(admin_user)
    visit admin_book_path(book)
  end

  scenario 'AdminUser tries to add author in book' do
    within '#authors-of-this-book_sidebar_section' do
      expect(page).to_not have_content author.name
    end

    select author.name, from: 'Name'
    click_on 'Add author'

    within '#authors-of-this-book_sidebar_section' do
      expect(page).to have_content author.name
    end
  end
end
