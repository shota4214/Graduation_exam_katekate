require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '記事モデル機能', type: :model do
    describe 'バリデーションのテスト' do
      let!(:user) { FactoryBot.create(:user) }
      context '記事のタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          article = Article.new(title: '', content: '失敗をテスト', type: 0)
          expect(article).not_to be_valid
        end
      end
      context '記事の内容が空の場合' do
        it 'バリデーションにひっかかる' do
          article = Article.new(title: '失敗をテスト', content: '', type: 0)
          expect(article).not_to be_valid
        end
      end
      context '記事のタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          article = FactoryBot.create(:article, user: user)
          expect(article).to be_valid
        end
      end
    end
    describe 'バリデーションのテスト' do
      let!(:user) { FactoryBot.create(:user) }
      context '質問のタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          article = Article.new(title: '', content: '失敗をテスト', type: 1)
          expect(article).not_to be_valid
        end
      end
      context '質問の内容が空の場合' do
        it 'バリデーションにひっかかる' do
          article = Article.new(title: '失敗をテスト', content: '', type: 1)
          expect(article).not_to be_valid
        end
      end
      context '質問のタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          question = FactoryBot.create(:question, user: user)
          expect(question).to be_valid
        end
      end
    end
  end
end
