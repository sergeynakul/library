module FeatureHelpers
  def sign_in(admin_user)
    visit new_admin_user_session_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_on 'Login'
  end
end
