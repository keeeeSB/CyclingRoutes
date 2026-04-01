require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  let!(:user) { create(:user, email: 'tarou@example.com', password: 'password12345', confirmed_at: Time.current) }

  describe 'ユーザーログイン' do
    it '登録済みのユーザーは、ログインできる' do
      visit root_path
      expect(page).to have_selector 'h2', text: 'ホーム'

      click_link 'ログイン'
      expect(page).to have_current_path new_user_session_path
      expect(page).to have_selector 'h2', text: 'ログイン'

      fill_in 'メールアドレス', with: 'tarou@example.com'
      fill_in 'パスワード', with: 'password12345'
      click_button 'ログインする'

      expect(page).to have_content 'ログインしました。'
      expect(page).to have_current_path root_path
      expect(page).to have_selector 'h2', text: 'ホーム'
    end
  end
end
