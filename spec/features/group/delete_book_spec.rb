require 'rails_helper'

feature 'AdminUser can delete book from group', "
  In order delete book from group
  As an authenticated AdminUser
  I'd like to be able to delete book from group
" do
  given(:group) { create(:group) }
  given(:admin_user) { create(:admin_user, role: 'group') }
  given(:picture) { fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/girls.jpg", 'image/jpg') }
  given!(:book) { create(:book, picture: picture, group: group) }

  background do
    sign_in(admin_user)
    visit admin_group_path(group)
  end

  scenario 'AdminUser tries to delete book from group' do
    expect(page).to have_content book.title

    click_on 'Delete'

    expect(page).to have_content book.title
  end
end
