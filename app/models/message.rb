class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :body, presence: true
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.strftime("%y/%m/%d at %k:%M")
  end
end
