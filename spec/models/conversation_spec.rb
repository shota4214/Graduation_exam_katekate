require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe '会話ルームモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      let!(:second_user) { FactoryBot.create(:second_user) }
      let!(:third_user) { FactoryBot.create(:third_user) }
      context '送信者と受信者が同じ場合' do
        it '会話ルームが作成できない' do
          conversation = Conversation.create(sender_id: second_user.id, recipient_id: third_user.id)
          second_conversation = Conversation.create(sender_id: second_user.id, recipient_id: third_user.id)
          expect(second_conversation).not_to be_valid
        end
      end
      context '送信者と受信者が同じでない場合' do
        it '会話ルームが作成できる' do
          conversation = Conversation.create(sender_id: second_user.id, recipient_id: third_user.id)
          expect(conversation).to be_valid
        end
      end
    end
  end
end
