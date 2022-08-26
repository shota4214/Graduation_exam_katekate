# require 'rails_helper'

# def login
#   visit new_user_session_path
#   fill_in 'user[email]', with: 'test@test.com'
#   fill_in 'user[password]', with: '12345678'
#   click_button 'ログイン'
# end

# RSpec.describe 'ユーザー管理機能', type: :system do
#   describe '新規ユーザー登録機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     let!(:article) { FactoryBot.create(:article, user: user) }
#     context 'ユーザーを新規作成した場合' do
#       it '新規ユーザー登録ができる' do
#         visit new_user_registration_path
#         fill_in 'user[name]', with: 'テストユーザー'
#         fill_in 'user[email]', with: 'katekate@test.com'
#         fill_in 'user[password]', with: '12345678'
#         fill_in 'user[password_confirmation]', with: '12345678'
#         click_button '登録'
#         expect(page).to have_content 'アカウント登録が完了しました。'
#       end
#     end
#     context '登録した情報でログインした場合' do
#       it 'ログインができる' do
#         visit new_user_session_path
#         fill_in 'user[email]', with: 'test@test.com'
#         fill_in 'user[password]', with: '12345678'
#         click_button 'ログイン'
#         expect(page).to have_content 'ログインしました。'
#       end
#     end
#     context '登録した情報でログインした場合' do
#       it '最新記事・質問一覧画面に遷移できる' do
#         login
#         expect(page).to have_content '最新記事・質問一覧'
#       end
#     end
#     context '登録した情報でログインした場合' do
#       it 'マイページ画面に遷移できる' do
#         login
#         click_link 'マイページ'
#         expect(current_path).to eq user_path(user)
#       end
#     end
#     context 'ログアウトボタンを押した場合' do
#       it 'ログアウトができる' do
#         login
#         click_link 'ログアウト'
#         expect(page).to have_content 'ログアウトしました。'
#       end
#     end
#   end
#   describe '管理者機能' do
#     let!(:admin_user) { FactoryBot.create(:admin_user) }
#     context '管理者でログインした場合' do
#       it '管理画面にアクセスができる' do
#         visit new_user_session_path
#         fill_in 'user[email]', with: 'admin@test.com'
#         fill_in 'user[password]', with: '12345678'
#         click_button 'ログイン'
#         click_link '管理者ページ'
#         expect(current_path).to eq rails_admin_path
#       end
#     end
#   end
# end