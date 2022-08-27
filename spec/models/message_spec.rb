require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      let!(:second_user) { FactoryBot.create(:second_user) }
      let!(:third_user) { FactoryBot.create(:third_user) }
      context 'メッセージが空の場合' do
        it 'バリデーションにひっかる' do
          conversation = Conversation.create(sender_id: second_user.id, recipient_id: third_user.id)
          message = Message.create(body: '', user_id: second_user.id, conversation_id: conversation.id)
          expect(message).not_to be_valid
        end
      end
      context 'メッセージが空でない場合' do
        it 'メッセージが送信できる' do
          conversation = Conversation.create(sender_id: second_user.id, recipient_id: third_user.id)
          message = Message.create(body: 'テスト送信', user_id: second_user.id, conversation_id: conversation.id)
          expect(message).to be_valid
        end
      end
    end
  end
end
