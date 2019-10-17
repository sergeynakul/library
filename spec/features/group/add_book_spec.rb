require 'rails_helper'

feature 'AdminUser can add book in group', "
  In order add book in group
  As an authenticated AdminUser
  I'd like to be able to add book in group
" do
  given(:group) { create(:group) }
  given(:admin_user) { create(:admin_user, role: 'group') }
  given(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
  given!(:book) { create(:book, picture: picture) }

  background do
    sign_in(admin_user)
    visit admin_group_path(group)
  end

  scenario 'AdminUser tries to add book in group' do
    within '#books-in-this-group_sidebar_section' do
      expect(page).to_not have_content book.title
    end

    select book.title, from: 'Title'
    click_on 'Add book'

    within '#books-in-this-group_sidebar_section' do
      expect(page).to have_content book.title
    end
  end
end
