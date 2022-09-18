module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_article = link_to 'あなたの投稿', article_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    @conversation = Conversation.find(notification.conversation_id)
    @message = nil
    case notification.action
      when "follow" then
        tag.a(notification.visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:article_path(notification.article_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
        @comment = Comment.find_by(id: @visitor_comment)&.content
        tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:article_path(notification.article_id), style:"font-weight: bold;")+"にコメントしました"
      when "dm" then
        @message = @conversation.messages.last
        tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたにメッセージ', href:users_path(current_user.id), style:"font-weight: bold;")+"しました"
    end
	end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
