require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      let!(:user) { FactoryBot.create(:user) }
      context 'ユーザーの名前が空の場合' do
        it 'バリデーションにひっかる' do
          user = User.new(name: '', email: 'email@test.com', password: "12345678", password_confirmation: "12345678")
          expect(user).not_to be_valid
        end
      end
      context 'ユーザーのメールアドレスが空の場合' do
        it 'バリデーションにひっかかる' do
          user = User.new(name: 'test', email: '', password: "12345678", password_confirmation: "12345678")
          expect(user).not_to be_valid
        end
      end
      context 'ユーザーのパスワードが半角8文字以下の場合' do
        it 'バリデーションにひっかかる' do
          user = User.new(name: 'test', email: 'email@test.com', password: "123456", password_confirmation: "123456")
          expect(user).not_to be_valid
        end
      end
      context 'ユーザーの名前とメールアドレス、パスワードがきちんとが記載されている場合' do
        it 'バリデーションが通る' do
          user = User.new(name: 'test', email: 'email@test.com', password: "12345678", password_confirmation: "12345678")
          expect(user).to be_valid
        end
      end
    end
  end
end
