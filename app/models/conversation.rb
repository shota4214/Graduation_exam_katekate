class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id
  scope :between, ->(sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end

  def message_recipient_id(current_user)
    if self.recipient_id == current_user.id
      self.sender_id
    else
      self.recipient_id
    end
  end

  def create_notification_dm(current_user, message_id)
    @conversation = self
    if @conversation.sender_id == current_user.id
      @visited_id = @conversation.recipient_id
    else
      @visited_id = @conversation.sender_id
    end
    notification = current_user.active_notifications.new(
      conversation_id: @conversation.id,
      message_id: message_id,
      visited_id: @visited_id,
      action: "dm"
    )
    notification.save if notification.valid?
  end
end
