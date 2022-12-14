class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @recipient_user_id = @conversation.message_recipient_id(current_user)
    @recipient_user = User.find(@recipient_user_id)
    @message = @conversation.messages.build(message_params)
    @message_conversation = @message.conversation 
    if @message.save
      ContactMailer.message_mail(@recipient_user, current_user).deliver
      @message_conversation.create_notification_dm(current_user, @message.id)
      redirect_to conversation_messages_path(@conversation), notice: "メッセージを送信しました。"
    else
      redirect_to conversation_messages_path(@conversation), notice: "メッセージを入力してください。"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
