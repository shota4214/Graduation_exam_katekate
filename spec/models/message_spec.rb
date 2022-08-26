require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      let!(:sender_user) { FactoryBot.create(:sender_user) }
      let!(:recipient_user) { FactoryBot.create(:recipient_user) }
      let!(:conversation) { FactoryBot.create(:conversation) }
      binding.pry
      context 'メッセージが空の場合' do
        it 'バリデーションにひっかる' do
          user = Message.create(body: '', user_id: sender_user, conversation_id: conversation)
          expect(user).not_to be_valid
        end
      end
    end
  end
end
