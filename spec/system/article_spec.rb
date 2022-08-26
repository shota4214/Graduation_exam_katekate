# require 'rails_helper'

# def login
#   visit new_user_session_path
#   fill_in 'user[email]', with: 'test@test.com'
#   fill_in 'user[password]', with: '12345678'
#   click_button 'ログイン'
# end

# RSpec.describe '記事・質問機能', type: :system do
#   describe '記事CRUD機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     let!(:article) { FactoryBot.create(:article, user: user) }
#     context '記事を新規作成した場合' do
#       it '作成した記事が表示される' do
#         login
#         click_link '記事投稿'
#         select '記事', from: 'article[type]'
#         fill_in 'article[title]', with: '記事タイトル'
#         fill_in 'article[content]', with: '記事内容'
#         click_button '記事投稿'
#         click_button '投稿する'
#         expect(page).to have_content '記事'
#         expect(page).to have_content '記事タイトル'
#         expect(page).to have_content '記事内容'
#       end
#     end
#     context '記事を編集した場合' do
#       it '編集した記事が表示される' do
#         login
#         click_link 'マイページ'
#         click_link '編集'
#         fill_in 'article[content]', with: '編集しました'
#         click_button '記事投稿'
#         expect(page).to have_content '編集しました'
#       end
#     end
#     context '記事を削除した場合' do
#       it '削除した記事が表示されない' do
#         login
#         click_link 'マイページ'
#         click_link '削除'
#         expect(page.accept_confirm).to eq "本当に削除しても良いですか？"
#         expect(page).not_to have_content 'test_content'
#       end
#     end
#       context 'ログインをしていない場合' do
#       it '記事が投稿できない' do
#         visit root_path
#         expect(page).not_to have_button '記事投稿'
#       end
#     end
#   end
#   describe '質問CRUD機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     let!(:question) { FactoryBot.create(:question, user: user) }
#     context '質問を新規作成した場合' do
#       it '作成した質問が表示される' do
#         login
#         click_link '記事投稿'
#         select '質問', from: 'article[type]'
#         fill_in 'article[title]', with: '質問タイトル'
#         fill_in 'article[content]', with: '質問内容'
#         click_button '記事投稿'
#         click_button '投稿する'
#         expect(page).to have_content '質問'
#         expect(page).to have_content '質問タイトル'
#         expect(page).to have_content '質問内容'
#       end
#     end
#     context '質問を編集した場合' do
#       it '編集した質問が表示される' do
#         login
#         click_link 'マイページ'
#         click_link '編集'
#         fill_in 'article[content]', with: '編集しました'
#         click_button '記事投稿'
#         expect(page).to have_content '編集しました'
#       end
#     end
#     context '質問を削除した場合' do
#       it '削除した質問が表示されない' do
#         login
#         click_link 'マイページ'
#         click_link '削除'
#         expect(page.accept_confirm).to eq "本当に削除しても良いですか？"
#         expect(page).not_to have_content 'test_content'
#       end
#     end
#     context 'ログインをしていない場合' do
#       it '質問が投稿できない' do
#         visit root_path
#         expect(page).not_to have_button '記事投稿'
#       end
#     end
#   end
#   describe '記事の下書き機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     context '記事を下書き保存した場合' do
#       it '作成した記事に下書き表示がされる' do
#         login
#         click_link '記事投稿'
#         select '記事', from: 'article[type]'
#         fill_in 'article[title]', with: 'test_title'
#         fill_in 'article[content]', with: 'test_content'
#         click_button '下書き保存'
#         click_button '下書き保存'
#         click_link 'マイページ'
#         expect(page).to have_content '下書き保存中'
#       end
#     end
#     context '記事を下書き保存した場合' do
#       it '記事一覧ページには表示されない' do
#         login
#         click_link '記事投稿'
#         select '記事', from: 'article[type]'
#         fill_in 'article[title]', with: 'test_title'
#         fill_in 'article[content]', with: 'test_content'
#         click_button '下書き保存'
#         click_button '下書き保存'
#         expect(page).to have_content '下書き保存中'
#       end
#     end
#     context '下書き記事を編集した場合' do
#       let!(:article_draft) { FactoryBot.create(:article_draft, user: user) }
#       it '編集した記事が表示される' do
#         login
#         click_link 'マイページ'
#         click_link '編集'
#         fill_in 'article[content]', with: '編集しました'
#         click_button '記事投稿'
#         expect(page).to have_content '編集しました'
#         expect(page).not_to have_content '下書き保存中'
#       end
#     end
#   end
#     describe 'コメント機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     let!(:second_user) { FactoryBot.create(:second_user) }
#     let!(:article) { FactoryBot.create(:article, user: user) }
#     context '自分の記事にコメントした場合' do
#       it '記事にコメント表示がされる' do
#         login
#         click_link 'マイページ'
#         click_link '詳細'
#         fill_in 'comment[content]', with: 'コメントをしました'
#         click_button 'コメント'
#         expect(page).to have_content 'test_name コメントをしました'
#       end
#     end
#     context '他者の記事にコメントした場合' do
#       it '記事にコメント表示がされる' do
#         login
#         click_link 'article_title'
#         fill_in 'comment[content]', with: 'あなたの記事にコメントをしました'
#         click_button 'コメント'
#         expect(page).to have_content 'test_name あなたの記事にコメントをしました'
#       end
#     end
#   end
#   describe '検索機能' do
#     let!(:user) { FactoryBot.create(:user) }
#     let!(:second_user) { FactoryBot.create(:second_user) }
#     let!(:article) { FactoryBot.create(:article, user: user) }
#     let!(:second_article) { FactoryBot.create(:article, user: second_user) }
#     let!(:question) { FactoryBot.create(:question, user: user) }
#     context '検索したいタイトルを入力した場合' do
#       it '検索した記事が表示される' do
#         login
#         fill_in 'q[title_or_content_or_user_name_cont]', with: 'article'
#         click_button '検索'
#         expect(page).to have_content 'article_title'
#         expect(page).not_to have_content 'question_title'
#       end
#     end
#     context '検索したい記事内容を入力した場合' do
#       it '検索した記事が表示される' do
#         login
#         fill_in 'q[title_or_content_or_user_name_cont]', with: 'article'
#         click_button '検索'
#         expect(page).to have_content 'article_content'
#         expect(page).not_to have_content 'question_content'
#       end
#     end
#     context '検索したいユーザー名を入力した場合' do
#       it '検索したユーザーの記事が表示される' do
#         login
#         fill_in 'q[title_or_content_or_user_name_cont]', with: 'second'
#         click_button '検索'
#         expect(page).to have_content 'second_name'
#       end
#     end
#   end
# end